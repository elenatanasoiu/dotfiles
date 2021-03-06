## Disabling CAPS LOCK

If you haven't already done so, gain an extra key and open up your System Preferences > Keyboard > Modifier Keys ...
and rebind CAPSLOCK to No Action.

## Rebinding CAPSLOCK to CONTROL_R (Right Control Key)

Install Seil
Open Seil && Change "Caps Lock" to keycode 62.

## Rebinding CONTROL_R (Right Control Key) to CONTROL + B

Install Karabiner
Open Karabiner > Misc & Uninstall

Click "Open private.xml"
Open private.xml

Copy and Paste the private.xml provided below.
Go to Karabiner > Change Key
Click "ReloadXML"
Toggle open "TMUX Key Remappings"
Check "TMUX: Right Control to Control+B

Restart your computer

======================================================
contents for private.xml:

<?xml version="1.0"?>
<root>
  <appdef>
    <appname>Terminal</appname>
    <equal>com.apple.Terminal</equal>
    <equal>iTerm</equal>
    <equal>net.sourceforge.iTerm</equal>
    <equal>com.googlecode.iterm2</equal>
  </appdef>
  <item>
    <name>TMUX Key Remappings</name>
    <item>
      <name>TMUX: Right Control to Ctrl+B</name>
      <identifier>private.right_control_to_control_b</identifier>
      <only>Terminal</only>
      <autogen>
        --KeyToKey--
        KeyCode::CONTROL_R,
        KeyCode::B, ModifierFlag::CONTROL_L
      </autogen>
    </item>
  </item>
</root>
=============================================