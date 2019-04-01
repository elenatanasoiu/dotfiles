# frozen_string_literal: true

require 'time'
require 'yaml'

def update_git
  puts 'fetching changes'
  `git fetch`
  puts 'pruning stale references'
  `git remote prune origin`
  puts 'checking out and pulling development'
  `git checkout development`
  `git pull`
end

def get_branch_info(branch_name)
  updated = Time.parse(`git show --format="%cI" #{branch_name} | head -n 1`.strip)
  author = `git show --format="%an" #{branch_name} | head -n 1`.strip
  commit_hash = `git show --format="%h" #{branch_name} | head -n 1`.strip

  {
      name: branch_name,
      commit_hash: commit_hash,
      updated: updated,
      author: author
  }
end

def merged_branches
  branches = `git branch -r --merged | grep -v HEAD | grep -v 'origin/development$' | grep -v 'origin/master$'`.split("\n").map do |branch|
    get_branch_info(branch.strip)
  end

  branches.sort_by { |a| a[:updated] }
end

def unmerged_branches
  branches = `git branch -r --no-merged | grep -v HEAD | grep -v 'origin/development$' | grep -v 'origin/master$'`.split("\n").map do |branch|
    get_branch_info(branch.strip)
  end

  branches.sort_by { |a| a[:updated] }
end

def by_author(branch_list)
  branch_list.each_with_object({}) do |branch, h|
    h[branch[:author]] ||= []
    h[branch[:author]] << branch.dup
  end
end

def partition_by_time(branch_list, time)
  branch_list.partition { |branch| branch[:updated] < time }
end

def backup(branch_list, name)
  filename = "#{name}_#{Time.now}_backup.yaml"
  File.write(filename, branch_list.to_yaml)

  puts "Saving #{name} data to #{filename}"
end

def confirm(msg)
  puts msg
  input = gets

  %w[y yes].include?(input.strip.downcase)
end

def print_stats(branch_list, title)
  full_title = "#{title} Total: #{branch_list.count}"
  puts '=' * full_title.length
  puts full_title
  puts '=' * full_title.length

  puts 'By author:'
  by_author(branch_list).each do |author, branches|
    puts "  #{author}: #{branches.count}"
  end
  puts
end

def delete_branches(branches)
  branches.each do |branch|
    `git push origin --delete #{branch[:name].delete_prefix("origin/")}`
  end
end

# Make sure git info is up to date
update_git

#  Merged branches
merged = merged_branches
puts 'Gathering data for merged branches'
backup(merged, 'merged_branches')

print_stats(merged, 'Merged branches')
if confirm('Are you sure  you want to delete all merged branches?')
  delete_branches(merged)
  puts 'done'
else
  puts 'Skipping merged branches'
end

#  Unmerged branches
puts 'Gathering data for unmerged branches'
unmerged = unmerged_branches

old_threshold = Time.now - 3600 * 24 * 90 # 3 months
old_unmerged, recent_unmerged = partition_by_time(unmerged, old_threshold)

backup(recent_unmerged, 'recent_unmerged')
backup(old_unmerged, 'old_unmerged')

print_stats(recent_unmerged, 'Recent Unmerged branches')
print_stats(old_unmerged, 'Old Unmerged branches')

if confirm('Are you sure  you want to delete all old unmerged branches?')
  delete_branches(old_unmerged)
  puts 'done'
else
  puts 'Skipping old unmerged branches'
end