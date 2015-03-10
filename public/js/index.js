$(document).ready(function() {
  $('#fullpage').fullpage({
    slidesNavigation: false,
    loopHotizontal: false,
    loopBottom: true,
    loopTop: true
  });

  var host = 'http://localhost:4567',
      testName = undefined;

  var bindBtns = function() {
  	$( '#iOS-platform' ).bind( 'click' , function() {
  		$.fn.fullpage.moveTo( 0 , 1);
  	});

    $( '#android-platform' ).bind( 'click' , function() {
      $.fn.fullpage.moveTo( 0 , 2 );
    })

  	$( '.back-btn' ).bind( 'click' , function() {
  		$.fn.fullpage.moveTo( 0 , 0);
      testName = undefined;
  	});
    $('#ios-run-test').bind('click' , function() {
      runTest('ios');
    });
    $('#android-run-test').bind( 'click' , function() {
      runTest('android');
    });
  };


  var bindTestCases = function( te , platform ) {
    $( '#' + platform + te).bind( 'click' , function() {
      testSelction( te , platform);
    })
  }

  var testSelction = function(te , platform) {
    if (te == undefined){} else {
      $('#'+ platform +'-selection-wrper')
        .empty()
        .append('<h2>'+ te + ' selected</h2>');
      testName = te;
    }
  };

  var runTest = function( platform ) {
    if (testName == undefined) {
      $.get( host + '/test/' + platform , function( data ) {
        console.log(data);
      });
    } else {
      $.get( host + '/test/' + platform + '/' + testName );
    }
  };

  var getTestCase = function(platform) {
    $.get( host + "/get_cases/" + platform, function(data) {
      parseTestcase( data , platform );
    });
  } 

  var parseTestcase = function(data , platform) {
    test = JSON.parse( data );
    test.forEach(function( test ) {
      var test = test.split( '/' ).pop();
      test = test.split( '.' );
      test.pop();
      test = test[0];
      addCases( test , platform );
    });
  }

  var addCases = function(te , platform) {
    $('#'+ platform +'-testcases').append('<li role="presentation"><a role="menuitem" class="test-sel '+platform+"-test"+'" id="'+ platform + te +'" herf="#">'+te+'</a></li>');
    bindTestCases( te , platform );
  }

  var init = function() {
    bindBtns();
    getTestCase('ios');
    getTestCase('android');
  };


  init();
});





