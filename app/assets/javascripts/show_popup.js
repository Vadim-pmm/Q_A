// addClass() doesn't go into the 'fx' queue, so put it in there manually
function showPopup() {
    $('#myPopup').addClass('show').delay(3000).queue(function () {
        $(this).removeClass('show');
        $('.popup').remove();
        $(this).dequeue();
    });
}