document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

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

// document.addEventListener("turbolinks:load", function() {
//   $input = $("[data-behavior='autocomplete-locat']")
//   var options = {
//     getValue: "name",
//     url: function(phrase) {
//       return "/search.json?q=" + phrase;
//     },
//     categories: [
//     {
//       listLocation: "locations",
//       header: "<strong><i class='fa fa-map-marker'></i>Locations</strong>",
//     }
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
// Type Restauran
function getListTypeChecked() {
  var type = []
  $('.common-type:checked').each(function() {
    type.push($(this).val());
  });
  return type;
}
// Type Booking-order
function getBookingOrderChecked() {
  var type = []
  $('.booking-order-type:checked').each(function() {
    if($(this).val() == "order"){
     $('.minmum_order').show();
     $('.time_delivery').show();
    }
    if($(this).val() == "booking"){
     $('.minmum_booking').show();
     $('.time_booking').show();
    }

    type.push($(this).val());
  });
  $('.booking-order-type:not(:checked)').each(function() {
    if($(this).val() == "order"){
     $('.minmum_order').hide();
     $('.time_delivery').hide();
    }
    if($(this).val() == "booking"){
     $('.time_booking').hide();
     $('.time_booking').hide();
    }
  });
  return type;
}

function getTimeOrder(){
  var time = $('input[name=order_before]:checked').val();
  return time;
}
function getTimeBooking(){
  var time = $('input[name=booking_before]:checked').val();
  return time;
}
function getMinOrder(){
  var min = $('input[name=min_order]:checked').val();
  return min;
}
function getMinBooking(){
  var min = $('input[name=min_booking]:checked').val();
  return min;
}
function activeStar1(){ 
  $('ul').removeClass("active");
  $('ul[id=1]').addClass('active');
  handleClickCheckbox(1);
}
function activeStar2(){ 
  $('ul').removeClass("active");
  $('ul[id=2]').addClass('active');
  handleClickCheckbox(2);
}
function activeStar3(){ 
  $('ul').removeClass("active");
  $('ul[id=3]').addClass('active');
  handleClickCheckbox(3);
}
function activeStar4(){ 
  $('ul').removeClass("active");
  $('ul[id=4]').addClass('active');
  handleClickCheckbox(4);
}
function activeStar5(){ 
  $('ul').removeClass("active");
  $('ul[id=5]').addClass('active');
  handleClickCheckbox(5)
}

function getStar(){
  var star = $("ul").filter(".active").attr("id");
  if(star == undefined)
    return 0;
  return star;
}

function handleClickCheckbox(event) {
  var text_search = $('.search-box-input').val();
  var types = getListTypeChecked();
  var booking_order = getBookingOrderChecked();
  
  var time_order = getTimeOrder();
  var time_booking = getTimeBooking();
  var min_order = getMinOrder();
  var min_booking = getMinBooking();
  var star = getStar();

  var path = '/search?utf8=✓&q=' + text_search
  if(booking_order.length > 0){
    path += '&booking_order%5B%5D=' + booking_order
  }
  if(types.length > 0) {
    path += '&types%5B%5D=' + types
  }
  if(time_order != "on"){
    path += '&order_before=' + time_order
  }
    if(time_booking != "on"){
    path += '&time_to_eat=' + time_booking
  }
    if(min_order != "on"){
    path += '&min_order=' + min_order
  }
    if(min_booking != "on"){
    path += '&min_booking=' + min_booking
  }
  if(star == "1" || star == "2" || star == "3" || star == "4" || star == "5"){
    path += '&star=' + star
  }



  window.history.pushState('a', 'a', path);
  $.ajax({
    url: '/search',
    type: 'GET',
    dataType: 'json',
    data: {q: text_search,
      types: getListTypeChecked(),
      booking_order: getBookingOrderChecked(),
      time_order: getTimeOrder(),
      time_booking: getTimeBooking(),
      min_order: getMinOrder(),
      min_booking: getMinBooking(),
      star: getStar()
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
