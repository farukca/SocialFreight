ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
      add: function(element, settings, message) {
        var errorElement, wrapper;

        settings.wrapper_tag = ".control-group";
        settings.error_tag = "span";
        settings.error_class = "help-inline";
        settings.wrapper_error_class = "error";

        if (element.data('valid') !== false) {
          wrapper = element.closest(settings.wrapper_tag);
          wrapper.addClass(settings.wrapper_error_class);
          errorElement = $("<" + settings.error_tag + "/>", {
            "class": settings.error_class,
            text: message
          });
          return wrapper.find(".controls").append(errorElement);
        } else {
          return element.parent().find("" + settings.error_tag + "." + settings.error_class).text(message);
        }
      },
      remove: function(element, settings) {
        var errorElement, wrapper;

        settings.wrapper_tag = ".control-group";
        settings.error_tag = "span";
        settings.error_class = "help-inline";
        settings.wrapper_error_class = "error";

        wrapper = element.closest("" + settings.wrapper_tag + "." + settings.wrapper_error_class);
        wrapper.removeClass(settings.wrapper_error_class);
        errorElement = wrapper.find("" + settings.error_tag + "." + settings.error_class);
        return errorElement.remove();
      }
};
