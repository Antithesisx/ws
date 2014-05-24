ws
==

Workspaces for the CLI. Categorize your files and retain an oversight.

### Dependencies

You must be using the [fish shell](http://fishshell.com/) in order to use this program.


### Usage

`ws switch foo` to switch to the foo workspace. This simply sets the ws variable to `$HOME/ws/foo`, and no immediate change is noticed.

`ws add bar` to add the file / directory `bar` to the current workspace. If `bar` is a file, it will create a hardlink inside `$HOME/ws/foo`. If `bar` is a directory, or a file that is not on the same partition as your home directory, it will create a symlink instead.

`ws` to cd to the current workspace, where you can find all the files you've added in one oversight.


### Advanced usage

The fun part is that you can put workspaces inside other workspaces. TODO: experiment with this and give some examples.


### Installation

```
cd /tmp
git clone https://github.com/Antithesisx/ws.git
cp ws/ws.fish $HOME/.config/fish/functions/
echo "set ws" >> $HOME/.config/fish/config.fish
```
