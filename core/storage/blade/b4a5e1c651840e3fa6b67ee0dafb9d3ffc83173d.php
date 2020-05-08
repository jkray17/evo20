<?php
// invoke OnManagerTreeInit event
$evtOut = $modx->invokeEvent('OnManagerTreeInit', $_REQUEST);
if(is_array($evtOut)) {
    echo implode("\n", $evtOut);
}
?>

<div class="treeframebody">
    <div id="treeMenu">

        <a class="treeButton" id="treeMenu_expandtree" onclick="modx.tree.expandTree();" title="<?php echo e(ManagerTheme::getLexicon('expand_tree')); ?>"><i class="<?php echo e($_style['icon_arrow_down_circle']); ?>"></i></a>

        <a class="treeButton" id="treeMenu_collapsetree" onclick="modx.tree.collapseTree();" title="<?php echo e(ManagerTheme::getLexicon('collapse_tree')); ?>"><i class="<?php echo e($_style['icon_arrow_up_circle']); ?>"></i></a>

        <?php if($modx->hasPermission('new_document')): ?>
            <a class="treeButton" id="treeMenu_addresource" onclick="modx.tabs({url:'<?php echo e(MODX_MANAGER_URL); ?>?a=4', title: '<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>'});" title="<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>"><i class="<?php echo e($_style['icon_document']); ?>"></i></a>
            <a class="treeButton" id="treeMenu_addweblink" onclick="modx.tabs({url:'<?php echo e(MODX_MANAGER_URL); ?>?a=72', title: '<?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>'});" title="<?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>"><i class="<?php echo e($_style['icon_chain']); ?>"></i></a>
        <?php endif; ?>

        <a class="treeButton" id="treeMenu_refreshtree" onclick="modx.tree.restoreTree();" title="<?php echo e(ManagerTheme::getLexicon('refresh_tree')); ?>"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>

        <a class="treeButton" id="treeMenu_sortingtree" onclick="modx.tree.showSorter(event);" title="<?php echo e(ManagerTheme::getLexicon('sort_tree')); ?>"><i class="<?php echo e($_style['icon_sort']); ?>"></i></a>

        <?php if($modx->hasPermission('edit_document') && $modx->hasPermission('save_document')): ?>
        <a class="treeButton" id="treeMenu_sortingindex" onclick="modx.tabs({url: '<?php echo e(MODX_MANAGER_URL); ?>?a=56&id=0', title: '<?php echo e(ManagerTheme::getLexicon('sort_menuindex')); ?>'});" title="<?php echo e(ManagerTheme::getLexicon('sort_menuindex')); ?>"><i class="<?php echo e($_style['icon_sort_num_asc']); ?>"></i></a>
        <?php endif; ?>

        <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_images')): ?>
            <a class="treeButton" id="treeMenu_openimages" title="<?php echo e(ManagerTheme::getLexicon('images_management')); ?>&#013;<?php echo e(ManagerTheme::getLexicon('em_button_shift')); ?>"><i class="<?php echo e($_style['icon_camera']); ?>"></i></a>
        <?php endif; ?>

        <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_files')): ?>
            <a class="treeButton" id="treeMenu_openfiles" title="<?php echo e(ManagerTheme::getLexicon('files_management')); ?>&#013;<?php echo e(ManagerTheme::getLexicon('em_button_shift')); ?>"><i class="<?php echo e($_style['icon_files']); ?>"></i></a>
        <?php endif; ?>

        <?php if($modx->hasPermission('edit_template') || $modx->hasPermission('edit_snippet') || $modx->hasPermission('edit_chunk') || $modx->hasPermission('edit_plugin')): ?>
        <a class="treeButton" id="treeMenu_openelements" title="<?php echo e(ManagerTheme::getLexicon('element_management')); ?>&#013;<?php echo e(ManagerTheme::getLexicon('em_button_shift')); ?>"><i class="<?php echo e($_style['icon_elements']); ?>"></i></a>
        <?php endif; ?>

        <?php if($modx->hasPermission('empty_trash')): ?>
        <a class="treeButton treeButtonDisabled" id="treeMenu_emptytrash" title="<?php echo e(ManagerTheme::getLexicon('empty_recycle_bin_empty')); ?>"><i class="<?php echo e($_style['icon_trash']); ?>"></i></a>
        <?php endif; ?>

        <a class="treeButton" id="treeMenu_theme_dark" onclick="modx.tree.toggleTheme(event)" title="<?php echo e(ManagerTheme::getLexicon('manager_theme_mode_title')); ?>"><i class="<?php echo e($_style['icon_theme']); ?>"></i></a>

    </div>

    <div id="treeHolder">
        <?php
        // invoke OnManagerTreePrerender event
        $evtOut = $modx->invokeEvent('OnManagerTreePrerender', $modx->getDatabase()->escape($_REQUEST));
        if(is_array($evtOut)) {
            echo implode("\n", $evtOut);
        }
        $siteName = $modx->getPhpCompat()->entities($modx->getConfig('site_name'));
        ?>

        <div id="node0" class="rootNode"><a class="node" onclick="modx.tree.treeAction(event, 0)" data-id="0" data-title-esc="<?php echo e($siteName); ?>"><span class="icon"><i class="<?php echo e($_style['icon_sitemap']); ?>"></i></span><span class="title"><?php echo e($siteName); ?></span></a>
            <div id="treeloader"><i class="<?php echo e($_style['icon_cog']); ?> <?php echo e($_style['icon_spin']); ?>"></i></div>
        </div>
        <div id="treeRoot"></div>

        <?php
        // invoke OnManagerTreeRender event
        $evtOut = $modx->invokeEvent('OnManagerTreeRender', $modx->getDatabase()->escape($_REQUEST));
        if(is_array($evtOut)) {
            echo implode("\n", $evtOut);
        }
        ?>
    </div>
</div>
<?php /**PATH E:/OSPanel/domains/evo20/manager//views//frame/tree.blade.php ENDPATH**/ ?>