/**
 * Created by giannis on 23/12/2014.
 */
$('#fadeIn').click(function () {
    $('#mainContent').css({
        background: 'rgba(26, 188, 156,1)'
    });
    $('#fadeIn').css({
        'display': 'none'
    });
    $('#fadeOut').css({
        'display': 'inline'
    });
    $('.mapWithDec').css({
        'pointer-events':'auto',
        'opacity': '1',
        'filter': 'alpha(opacity=100)'
    });
    $('#overMap').fadeOut('slow');
    $('.tooltip-actions').fadeOut('slow');
    $('.youtube-actions').fadeOut('slow');
});
$('#fadeOut').click(function () {
    $('#mainContent').css({
        background: 'rgba(26, 188, 156,0.3)'
    });
    $('#fadeIn').css({
        'display': 'inline'
    });
    $('#fadeOut').css({
        'display': 'none'
    });
    $('.mapWithDec').css({
        'pointer-events':'none',
        'opacity': '0.3',
        'filter': 'alpha(opacity=30)'
    });
    $('#overMap').fadeIn('slow');
    $('.tooltip-actions').fadeIn('slow');
    $('.youtube-actions').fadeIn('slow');
});

/******START- Smooth scroll to element******/
function scrollTo(elementId, duration) {
    $('html, body').animate({
        scrollTop: $("#" + elementId).offset().top
    }, duration);
}
/******END- Smooth scroll to element******/