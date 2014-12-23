/**
 * Created by giannis on 23/12/2014.
 */
$(document).ready(function () {
    document.getElementById('map-canvas').style.pointerEvents = 'none';
    $('.tooltip-actions').hide().delay(300).fadeIn('slow');
    $('#welcomeTag').hide().delay(500).fadeIn('slow');
    $('#mainSearch').hide().delay(700).fadeIn('slow');
    $('#submitBtn').hide().delay(900).fadeIn('slow');
});
$('#fadeIn').click(function () {
    document.getElementById('map-canvas').style.pointerEvents = 'auto';
    $('#mainContent').css({
        background: 'rgba(26, 188, 156,1)'
    });
    $('#fadeIn').css({
        'display': 'none'
    });
    $('#fadeOut').css({
        'display': 'inline'
    });
    $('#map-canvas').css({
        'opacity': '1',
        'filter': 'alpha(opacity=100)'
    });
    $('#overMap').fadeOut('slow');
    $('.tooltip-actions').fadeOut('slow');
});
$('#fadeOut').click(function () {
    document.getElementById('map-canvas').style.pointerEvents = 'none';
    $('#mainContent').css({
        background: 'rgba(26, 188, 156,0.3)'
    });
    $('#fadeIn').css({
        'display': 'inline'
    });
    $('#fadeOut').css({
        'display': 'none'
    });
    $('#map-canvas').css({
        'opacity': '0.3',
        'filter': 'alpha(opacity=30)'
    });
    $('#overMap').fadeIn('slow');
    $('.tooltip-actions').fadeIn('slow');
});