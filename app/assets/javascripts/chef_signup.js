$(function() {
    $('body').on('click','.btn-checkbox',function(e) {
        e.stopPropagation();
        e.preventDefault();
        var $checkbox = $(this).find(':input[type=checkbox]');
        if ($checkbox.length) {
            var $icon = $(this).find('[data-icon-on]');
            if ($checkbox.is(':checked')) {
                unchecked($checkbox);
            } else {
                checked($checkbox);
            }
            return;
        }
        var $radio = $(this).find(':input[type=radio]');
        if ($radio.length) {
            var $group = $radio.closest('.btn-group');
            $group.find(':input[type=radio]').not($radio).each(function(){
                unchecked($(this));
            })
            var $icon = $(this).find('[data-icon-on]');
            if ($radio.is(':checked')) {
                unchecked($radio);
            } else {
                checked($radio);
            }
            return;
        }
    });
});


function checked($input) {
    var $button = $input.closest('.btn');
    var $icon = $button.find('[data-icon-on]');
    $button.addClass('active');
    $input.prop('checked', true);
    $icon.css('width',$icon.width());
    $icon.removeAttr('class').addClass($icon.data('icon-on'));
    $input.trigger('change');
}

function unchecked($input) {
    var $button = $input.closest('.btn');
    var $icon = $button.find('[data-icon-on]');
    $button.removeClass('active');
    $input.prop('checked', false);
    $icon.css('width',$icon.width());
    $icon.removeAttr('class').addClass($icon.data('icon-off'));
    $input.trigger('change');
}