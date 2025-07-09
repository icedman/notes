import Gtk from 'gi://Gtk';
import GObject from 'gi://GObject';

const Extension = Main.imports.Extension;

const MyExtension = GObject.registerClass(
  {},
  class MyExtension extends Extension {
    enable() {
      super.enable();
    }

    disable() {
      super.disable();
    }
  },
);

export default MyExtension;
