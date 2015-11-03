class UI
  constructor: ->
    @previousID = ""

  setting: ->
    @navBarConfig()
    @dropDownMenu()

  navBarConfig: ->
    if $(window).width() > 1024
      $(window).scroll =>
        @changeNavBarStyleByScrollLOC()

  changeNavBarStyleByScrollLOC: ->
    if $(window).scrollTop() > 400
      $("[data-id=navMenu]").css("background-color": "#777", "border-bottom": "2px solid #EE3524")
    else
      $("[data-id=navMenu]").css("background-color": "rgba(66, 66, 66, 0.5)", "border-bottom": "none")

  dropDownMenu: ->
    $("[data-id=navMenu] a").click (e) =>
      dataID = "[data-id=dropdown-#{$(e.currentTarget).data('id')}]"
      @closePreviousOpenedMenu(dataID, @previousID)
      $(dataID).slideToggle()
      @previousID = dataID

  closePreviousOpenedMenu: (currentMenu, previousMenu) ->
    if @availableClosingMenu(currentMenu, previousMenu)
      $(previousMenu).slideToggle(300)

  availableClosingMenu: (currentMenu, previousMenu) ->
    (currentMenu != previousMenu) && @checkPreviousMenuOpen(previousMenu)

  checkPreviousMenuOpen: (previousMenu) ->
    $(previousMenu).css("display") == "block"

window.UI = UI
