function showModal(question, answer, btn_id, question_id) {
    $('#myquestion').html(question);
    $('#myanswer').html(answer).hide();
    $('#btn_ok').show();

    $('.ui.modal').modal({
        onApprove: function (e) {
            $('#myanswer').show();
            $('#btn_ok').hide();
            return false;
        },

        onHide: function (e) {
            $.get('/mark_question_as_answered/' + question_id);
            if ($("button[id*='btn_']:hidden").length === 4 ) {
                location.reload();
             }
         }
    }).modal('show');
}

$(document).ready(function(){
    $('#btn_cancel').click(function(e) {
        e.preventDefault();
        $('#modal_form').addClass('animated hinge')
        .one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oAnimationEnd AnimationEnd', function () {
            $('#modal_form').removeClass('animated hinge').modal('hide');
        });
        return false;
    })
});
