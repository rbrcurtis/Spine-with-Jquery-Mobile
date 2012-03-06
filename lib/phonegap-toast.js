/*global PhoneGap*/
var Toasty = function() {
};

Toasty.prototype.showLong = function(message, win, fail) {
  PhoneGap.exec(win, fail, "Toasty", "show_long", [message]);
};

Toasty.prototype.showShort = function(message, win, fail) {
  PhoneGap.exec(win, fail, "Toasty", "show_short", [message]);
};

Toasty.prototype.cancel = function(win, fail) {
  PhoneGap.exec(win, fail, "Toasty", "cancel", []);
};

navigator.toast = new Toasty();

PhoneGap.addConstructor(function() {
	PhoneGap.addPlugin('toasty', new Toasty());
//	PluginManager.addService("Toasty","com.mut8ed.plugins.ToastPlugin");
});