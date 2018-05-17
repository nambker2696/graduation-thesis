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
      $(".show-search").empty();      
      if(data['locations'].length> 1){
        data['locations'].forEach(function(locat){


          $(".show-search").append('<div class="left-panel result-search"><div class="panel-default"><div class="col-md-12 locat-result">'+
            '<div class="chef-box"><ul><li><span class="chef-img">'+
            '<img alt="rss feed" src="'+ locat['name'] +'"></span><span class="chef-name">'+
            
            '<a href="/en/locations/'+locat['id']+'">'+
            '<h3>'+ locat['name'] +'</h3>'+
            '</a>'+
            '<p>'+ locat['address'] +'</p>'+
            '</span></li></ul></div>'+
            '<div class="chef-images"><ul>'+
            '<li><img alt="rss feed" src="/assets/food/1.jpg"></li>'+
            '<li><img alt="rss feed" src="/assets/food/2.jpg"></li>'+
            '<li><img alt="rss feed" src="/assets/food/3.jpg"></li>'+
            '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'+
            '<li count="25"><a href="#">+'+ '<%= j locat.dishes.count - 4 %>'+ 
            '</a></li></ul></div><div class="chef-food-detail"><ul><li><span class="detail-con">Cuisines:</span> Not Avaliable</li>'+
            '<li><span class="detail-con">Dish Count:</span>'+ 
            '<%= j locat.dishes.count %>' 
            +'dishes</li></ul><ul>'+
            '<li><span class="detail-con1 ordercount">No. of Orders: 36 </span></li>'+
            '</ul></div><div class="rating-wrap"><span class="rating-con one0">'+ 
            '<%= j render "shared/location_avg_rate", rate_avg: locat.rate_avg %>' +
            '<span rate="0">'+ locat['rate_avg'] +
            '&nbsp;|&nbsp;' + '<%= locat.reviews.count %>' +
            'Reviews</span></span> <span class="experince">Order Experience</span></div><div class="box-bottom-con"><ul><li>Delivers in 2 Hrs</li>'+
            '<li>Chef'+"'"+'s Min. Order Rs. 500</li></ul><ul><li><span class="wish-list"><a href=""><i class="fa fa-heart"></i>'+
            '</a></span><span class="view-more">'+'<%= link_to location_path(locat) do %>'+
            'View More<% end %></span></li></ul></div></div></div></div>'
            )}
          )}
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
