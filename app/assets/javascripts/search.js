// document.addEventListener("turbolinks:load", function() {
//   $input = $("[data-behavior='autocomplete']")

//   var options = {
//     getValue: "name",
//     url: function(phrase) {
//       return "/search.json?q=" + phrase;
//     },
//     categories: [
//       {
//         listLocation: "dishes",
//         header: "<strong><i class='fa fa-utensils'></i>Dishes</strong>",
//       },
//       {
//         listLocation: "locations",
//         header: "<strong><i class='fa fa-map-marker'></i>Locations</strong>",
//       }
//     ],
//     list: {
//       onChooseEvent: function() {
//         var url = $input.getSelectedItemData().url
//         $input.val("")
//         Turbolinks.visit(url)
//       }
//     }
//   }

//   $input.easyAutocomplete(options)
// });
document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete-locat']")
  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "locations",
        header: "<strong><i class='fa fa-map-marker'></i>Locations</strong>",
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});

function getListTypeChecked() {
  var type = []
  $('.common-type:checked').each(function() {
    type.push($(this).val());
  });
  return type;
}
function handleClickCheckbox(event) {
  var text_search = $('.search-box-input').val();
  var types = getListTypeChecked()
  var types_params = '&types%5B%5D=' + types
  var path = '/search?utf8=✓&q=' + text_search
  if (types_params.length > 0) {
    path += types_params
  }
  window.history.pushState('a', 'a', path);
  $.ajax({
    url: '/search',
    type: 'GET',
    dataType: 'json',
    data: {q: text_search,
          types: getListTypeChecked()
          },
    success: function(data){
      console.log(data);
    }
  })
  .done(function() {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
  
}
