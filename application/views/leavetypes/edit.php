<?php
/**
 * This view allows an HR admin to edit a leave type.
 * @copyright  Copyright (c) 2014-2016 Benjamin BALET
 * @license      http://opensource.org/licenses/AGPL-3.0 AGPL-3.0
 * @link            https://github.com/bbalet/jorani
 * @since         0.2.0
 */
?>

<?php $attributes = array('id' => 'formEditLeaveType');
echo form_open('leavetypes/edit/' . $id, $attributes); ?>
    <input type="hidden" name="id" value="<?php echo $id; ?>" />
    <label for="name"><?php echo lang('leavetypes_popup_update_field_name');?></label>
    <input type="text" name="name" id="name" value="<?php echo $type_name; ?>" />
    <label for="color">Color</label>
    <input type="color" name="color" id="color" value="<?php echo $type_color; ?>" />

    <br />
</form>
<button id="cmdEditLeaveType" class="btn btn-primary"><?php echo lang('leavetypes_popup_update_button_update');?></button>

<script type="text/javascript" src="<?php echo base_url();?>assets/js/bootbox.min.js"></script>
<script type="text/javascript">
    $(function () {
        //Check if the leave type is unique
        $('#cmdEditLeaveType').click(function() {
            var types = <?php echo json_encode($leavetypes); ?>;
            var id = <?php echo $id; ?>;
            var found = false;
            for(var key in types){
                if (id != types[key].id) {
                    if (types[key].name == $('#name').val()) {
                        found = true;
                        break;
                    }
                }
            }
            if (found == true) {
                bootbox.alert("<?php echo lang('leavetypes_js_unique_error_msg');?>");
            } else {
                $('#formEditLeaveType').submit();
            }
        });
    });
</script>
