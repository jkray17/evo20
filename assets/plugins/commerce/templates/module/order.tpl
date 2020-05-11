<?php $this->extend('layout.tpl'); ?>

<?php $this->block('title'); ?>
    <?= sprintf($lang['module.order_caption'], $order['id']) ?>
<?php $this->endBlock(); ?>

<?php $this->block('buttons'); ?>
    <a href="<?= $this->module->makeUrl('orders/edit', 'order_id=' . $order['id']) ?>" class="btn btn-primary">
        <i class="fa fa-pencil"></i>
        <span><?= $_lang['edit'] ?></span>
    </a>
    <a href="<?= $this->module->makeUrl('orders') ?>" class="btn btn-secondary" title="<?= $_lang['cancel'] ?>">
        <i class="fa fa-times-circle"></i>
        <span><?= $_lang['cancel'] ?></span>
    </a>
<?php $this->endBlock(); ?>

<?php $this->block('content'); ?>
    <div class="tab-page" id="tab_main">
        <h2 class="tab"><?= $lang['module.order_contents'] ?></h2>

        <script type="text/javascript">
            tpCommerce.addTabPage(document.getElementById('tab_main'));
        </script>

        <ul class="order-groups">
            <?php foreach ($groups as $group_id => $group): ?>
                <li id="group-<?= $group_id ?>" style="width: <?= $group['width'] ?>;">
                    <div class="sectionHeader">
                        <?= $group['title'] ?>
                    </div>
                    
                    <div class="sectionBody">
                        <table class="table data group-fields">
                            <?php foreach ($group['fields'] as $field): ?>
                                <tr>
                                    <td><?= $field['title'] ?>:</td>
                                    <td><?= $field['value'] ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                    </div>
            <?php endforeach; ?>
        </ul>

        <div class="cart-contents">
            <div class="sectionHeader">
                <?= $lang['module.cart_contents_title'] ?>
            </div>

            <div class="sectionBody">
                <div class="table-responsive">
                    <table class="table data">
                        <thead>
                            <tr>
                                <?php foreach ($columns as $column): ?>
                                    <td<?= !empty($column['style']) ? ' style="' . $column['style'] . '"' : '' ?>><?= $column['title'] ?></td>
                                <?php endforeach; ?>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($cartData as $row): ?>
                                <tr>
                                    <?php foreach ($row['cells'] as $name => $cell): ?>
                                        <td<?= !empty($columns[$name]['style']) ? ' style="' . $columns[$name]['style'] . '"' : '' ?>><?= $cell ?></td>
                                    <?php endforeach; ?>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>

                    <?php if (!empty($subtotals)): ?>
                        <table class="table data">
                            <thead>
                                <tr>
                                    <?php foreach ($subcolumns as $column): ?>
                                        <td<?= !empty($column['style']) ? ' style="' . $column['style'] . '"' : '' ?>><?= $column['title'] ?></td>
                                    <?php endforeach; ?>
                                </tr>
                            </thead>

                            <tbody>
                                <?php foreach ($subtotals as $row): ?>
                                    <tr>
                                        <?php foreach ($row['cells'] as $name => $cell): ?>
                                            <td<?= !empty($columns[$name]['style']) ? ' style="' . $columns[$name]['style'] . '"' : '' ?>><?= $cell ?></td>
                                        <?php endforeach; ?>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <div class="tab-page" id="tab_history">
        <h2 class="tab"><?= $lang['module.order_history_title'] ?></h2>

        <script type="text/javascript">
            tpCommerce.addTabPage(document.getElementById('tab_main'));
        </script>

        <div class="sectionHeader">
            <?= $lang['module.order_history_title'] ?>
        </div>

        <div class="sectionBody">
            <table class="table data">
                <thead>
                    <tr>
                        <td><?= $lang['module.status_change_date'] ?></td>
                        <td><?= $lang['module.status_title'] ?></td>
                        <td><?= $lang['module.is_customer_notified'] ?></td>
                        <td><?= $lang['module.status_change_description'] ?></td>
                        <td><?= $lang['module.user'] ?></td>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($history as $row): ?>
                        <tr>
                            <td style="white-space: nowrap;"><?= (new \DateTime($row['created_at']))->format('d.m.Y H:i:s') ?></td>
                            <td style="white-space: nowrap;"><?= !empty($statuses[$row['status_id']]) ? $statuses[$row['status_id']] : '' ?></td>
                            <td><?= !empty($row['notify']) ? $_lang['yes'] : $_lang['no'] ?></td>
                            <td><?= htmlentities($row['comment']) ?></td>
                            <td><?= $row['user_id'] > 0 ? htmlentities($users[$row['user_id']]) : '' ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div class="sectionHeader">
            <?= $lang['module.add_history'] ?>
        </div>

        <div class="sectionBody">
            <form action="<?= $module->makeUrl('orders/change-status') ?>" method="post">
                <table class="table">
                    <tr>
                        <td><?= $lang['module.status_title'] ?></td>
                        <td>
                            <select name="status_id">
                                <?php foreach ($statuses as $id => $title): ?>
                                    <option value="<?= $id ?>"><?= $title ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>

                    <tr>
                        <td><?= $lang['module.status_change_description'] ?></td>
                        <td><textarea name="description"></textarea></td>

                    <tr>
                        <td></td>
                        <td>
                            <label>
                                <input type="hidden" name="notify" value="0">
                                <input type="checkbox" name="notify" value="1">
                                <?= $lang['module.status_change_notify'] ?>
                            </label>
                        </td>
                </table>

                <input type="hidden" name="order_id" value="<?= $order['id'] ?>">
                <button type="submit" class="btn btn-secondary"><?= $_lang['submit'] ?></button>
            </form>
        </div>
    </div>
<?php $this->endBlock(); ?>
