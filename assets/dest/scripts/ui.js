(function() {
  var UI;

  UI = (function() {
    function UI() {
      this.previousID = "";
    }

    UI.prototype.setting = function() {
      this.navBarConfig();
      return this.dropDownMenu();
    };

    UI.prototype.navBarConfig = function() {
      if ($(window).width() > 1024) {
        return $(window).scroll((function(_this) {
          return function() {
            return _this.changeNavBarStyleByScrollLOC();
          };
        })(this));
      }
    };

    UI.prototype.changeNavBarStyleByScrollLOC = function() {
      if ($(window).scrollTop() > 400) {
        return $("[data-id=navMenu]").css({
          "background-color": "#777",
          "border-bottom": "2px solid #EE3524"
        });
      } else {
        return $("[data-id=navMenu]").css({
          "background-color": "rgba(66, 66, 66, 0.5)",
          "border-bottom": "none"
        });
      }
    };

    UI.prototype.dropDownMenu = function() {
      return $("[data-id=navMenu] a").click((function(_this) {
        return function(e) {
          var dataID;
          dataID = "[data-id=dropdown-" + ($(e.currentTarget).data('id')) + "]";
          _this.closePreviousOpenedMenu(dataID, _this.previousID);
          $(dataID).slideToggle();
          return _this.previousID = dataID;
        };
      })(this));
    };

    UI.prototype.closePreviousOpenedMenu = function(currentMenu, previousMenu) {
      if (this.availableClosingMenu(currentMenu, previousMenu)) {
        return $(previousMenu).slideToggle(300);
      }
    };

    UI.prototype.availableClosingMenu = function(currentMenu, previousMenu) {
      return (currentMenu !== previousMenu) && this.checkPreviousMenuOpen(previousMenu);
    };

    UI.prototype.checkPreviousMenuOpen = function(previousMenu) {
      return $(previousMenu).css("display") === "block";
    };

    return UI;

  })();

  window.UI = UI;

}).call(this);
