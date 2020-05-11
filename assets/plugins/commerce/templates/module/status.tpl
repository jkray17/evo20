<?php $this->extend('layout.tpl'); ?>

<?php $this->block('title'); ?>
    <?= !empty($status['id']) ? sprintf($lang['module.edit_status_caption'], $status['title']) : $lang['module.new_status_caption'] ?>
<?php $this->endBlock(); ?>

<?php $this->block('buttons'); ?>
    <a href="javascript:;" class="btn btn-success" onclick="document.getElementById('status_form').submit();" title="<?= $_lang['save'] ?>">
        <i class="fa fa-floppy-o"></i>
        <span><?= $_lang['save'] ?></span>
    </a>
    <a href="<?= $this->module->makeUrl('statuses') ?>" class="btn btn-secondary" title="<?= $_lang['cancel'] ?>">
        <i class="fa fa-times-circle"></i>
        <span><?= $_lang['cancel'] ?></span>
    </a>
<?php $this->endBlock(); ?>

<?php $this->block('content'); ?>
    <div class="tab-page" id="tab_main">
        <h2 class="tab"><?= $lang['module.status_data'] ?></h2>

        <script type="text/javascript">
            tpCommerce.addTabPage(document.getElementById('tab_main'));
        </script>

        <div class="sectionHeader">
            <?= $lang['module.status_data'] ?>
        </div>

        <div class="sectionBody">
            <form action="<?= $module->makeUrl('statuses/save') ?>" method="post" id="status_form">
                <table class="table">
                    <tr>
                        <td><?= $lang['module.status_title'] ?></td>
                        <td>
                            <input type="text" name="title" value="<?= htmlentities($module->getFormAttr($status, 'title')) ?>">
                        </td>

                    <tr>
                        <td><?= $lang['module.status_alias'] ?></td>
                        <td>
                            <input type="text" name="alias" value="<?= htmlentities($module->getFormAttr($status, 'alias')) ?>">
                        </td>

                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="hidden" name="notify" value="0">
                                <input type="checkbox" name="notify" value="1"<?= !empty($module->getFormAttr($status, 'notify')) ? ' checked' : '' ?>>
                                <?= $lang['module.status_change_notify'] ?>
                            </label>
                        </td>

                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="hidden" name="default" value="0">
                                <input type="checkbox" name="default" value="1"<?= !empty($module->getFormAttr($status, 'default')) ? ' checked' : '' ?>>
                                <?= $lang['module.default_field'] ?>
                            </label>
                        </td>
                </table>

                <?php if (!empty($status['id'])): ?>
                    <input type="hidden" name="status_id" value="<?= $status['id'] ?>">
                <?php endif; ?>

                <button type="submit" class="btn btn-secondary"><?= $_lang['save'] ?></button>
            </form>
        </div>
    </div>
<?php $this->endBlock(); ?>
