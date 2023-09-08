// $(document).ready(function () {
//   var url = window.location.href;
//   console.log(url);
//   if (url.indexOf("#") < 0) {
//     window.location.replace(url + "#");
//   } else {
//     window.location.replace(url);
//   }
// });
//header add class
// $(window).scroll(function () {
//   if ($(this).scrollTop() > 50) {
//     $("header").addClass("fixed-top");
//   } else {
//     $("header").removeClass("fixed-top");
//   }
// });

//on click move to browser top
$(document).ready(function () {
  $(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
      $("#movetop").fadeIn();
    } else {
      $("#movetop").fadeOut();
    }
  });
  //click event to scroll to top
  $("#movetop").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 200);
  });
});

document.onreadystatechange = function () {
  var state = document.readyState;
  if (state == "complete") {
    setTimeout(function () {
      document.getElementById("load").style.visibility = "hidden";
    }, 1000);
  }
};

//home slider
var swiper = new Swiper(".homeswiper", {
  pagination: {
    el: ".swiper-pagination",
    type: "progressbar",
  },
  autoplay: {
    delay: 5000,
    disableOnInteraction: true,
  },
  loop: true,
  loopFillGroupWithBlank: true,
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
});

//home page services swiper
var swiper = new Swiper(".service-swiper", {
  // slidesPerView: 4,
  spaceBetween: 0,
  autoplay: {
    delay: 5000,
    disableOnInteraction: true,
  },
  // init: false,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  breakpoints: {
    640: {
      slidesPerView: 2,
      spaceBetween: 0,
    },
    768: {
      slidesPerView: 2,
      spaceBetween: 0,
    },
    1024: {
      slidesPerView: 4,
      spaceBetween: 0,
    },
  },
});

$(document).ready(function () {
  //Horizontal Tab
  $(".parentHorizontalTab").easyResponsiveTabs({
    type: "default", //Types: default, vertical, accordion
    width: "auto", //auto or any width like 600px
    fit: true, // 100% fit in a container
    tabidentify: "hor_1", // The tab groups identifier
    activate: function (event) {
      // Callback function if tab is switched
      var $tab = $(this);
      var $info = $("#nested-tabInfo");
      var $name = $("span", $info);
      $name.text($tab.text());
      $info.show();
    },
  });
  // Child Tab
  $(".ChildVerticalTab_1").easyResponsiveTabs({
    type: "vertical",
    width: "auto",
    fit: true,
    tabidentify: "ver_1", // The tab groups identifier
    activetab_bg: "#fff", // background color for active tabs in this group
    inactive_bg: "#F5F5F5", // background color for inactive tabs in this group
    active_border_color: "#c1c1c1", // border color for active tabs heads in this group
    active_content_border_color: "#5AB1D0", // border color for active tabs contect in this group so that it matches the tab head border
  });
  //Vertical Tab
  $(".parentVerticalTab").easyResponsiveTabs({
    type: "vertical", //Types: default, vertical, accordion
    width: "auto", //auto or any width like 600px
    fit: true, // 100% fit in a container
    closed: "accordion", // Start closed if in accordion view
    tabidentify: "hor_1", // The tab groups identifier
    activate: function (event) {
      // Callback function if tab is switched
      var $tab = $(this);
      var $info = $("#nested-tabInfo2");
      var $name = $("span", $info);
      $name.text($tab.text());
      $info.show();
    },
  });
});

document.onreadystatechange = function () {
  var state = document.readyState;
  if (state == "complete") {
    setTimeout(function () {
      document.getElementById("load").style.visibility = "hidden";
    }, 1000);
  }
};
