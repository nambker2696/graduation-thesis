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
function getRateAvg(rate_avg){
  var rating_star = []
  switch(rate_avg) {
    case 0:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '</ul>'
    break;
    case 1:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '</ul>'
    break;
    case 2:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '</ul>'
    break;
    case 3:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '</ul>'
    break;
    case 4:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star-o fa-fw"></i>'+
    '</li>'+
    '</ul>'
    break;
    default:
    rating_star = '<ul class="star-filter">'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '<li class="fill_star ">'+
    '<i class="fa fa-star fa-fw"></i>'+
    '</li>'+
    '</ul>'
  }
  return rating_star;
}
function getDish(num_dish){
  var img_dish = []
  switch(num_dish) {
    case 1:
    img_dish = '<li><img alt="rss feed" src="/assets/food/1.jpg"></li>'
    break;
    case 2:
    img_dish = '<li><img alt="rss feed" src="/assets/food/2.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/3.jpg"></li>'
    break;
    case 3:
    img_dish = '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'
    break;
    default:
    img_dish = '<li><img alt="rss feed" src="/assets/food/2.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/3.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'+
               '<li><img alt="rss feed" src="/assets/food/4.jpg"></li>'
  }
  return img_dish;
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
      $(".show-search").empty();
      if(data['locations'].length> 1){
        var i =0;
        data['locations'].forEach(function(locat){
          var result_rate = Math.round(locat['rate_avg']);
          var ratestar = getRateAvg(result_rate);
          var num_dish =  getDish(data["dishes"][i]);
            $(".show-search").append('<div class="left-panel result-search"><div class="panel-default"><div class="col-md-12 locat-result">'+
              '<div class="chef-box"><ul><li><span class="chef-img">'+
              '<img alt="rss feed" src="/assets/logo_restorant/20176.jpg"></span><span class="chef-name">'+
              '<a href="/en/locations/'+locat['id']+'">'+
              '<h3>'+ locat['name'] +'</h3>'+
              '</a>'+
              '<p>'+ locat['address'] +'</p>'+
              '</span></li></ul></div>'+
              '<div class="chef-images"><ul>'+ num_dish +
              '<li count="25"><a href="#">+'+ data["dishes"][i]+ 
              '</a></li></ul></div><div class="chef-food-detail"><ul><li><span class="detail-con">Cuisines:</span> Not Avaliable</li>'+
              '<li><span class="detail-con">Dish Count:</span>'+ data["dishes"][i] +
              ' dishes</li></ul><ul>'+
              '<li><span class="detail-con1 ordercount">No. of Orders: 36 </span></li>'+
              '</ul></div><div class="rating-wrap"><span class="rating-con one0">'+ ratestar +
              '<span rate="0">'+ result_rate +
              '&nbsp;|&nbsp;' + data["reviews"][i] +
              'Reviews</span></span> <span class="experince">Order Experience</span></div><div class="box-bottom-con"><ul><li>Delivers in 2 Hrs</li>'+
              '<li>Chef'+"'"+'s Min. Order Rs. 500</li></ul><ul><li><span class="wish-list"><a href=""><i class="fa fa-heart"></i>'+
              '</a></span><span class="view-more">'+
              '<a href="/en/locations/'+locat['id']+'">View More</a>'+
              '</span></li></ul></div></div></div></div>'
              );
            i = i+1;
          });
        
      }
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
