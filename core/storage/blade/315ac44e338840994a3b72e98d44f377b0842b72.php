<!DOCTYPE html>
<html dir="<?php echo e(ManagerTheme::getTextDir()); ?>" lang="<?php echo e(ManagerTheme::getLang()); ?>" xml:lang="<?php echo e(ManagerTheme::getLang()); ?>">
<head>
    <title><?php echo e($modx->getConfig('site_name')); ?> - (Evolution CMS Manager)</title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo e(ManagerTheme::getCharset()); ?>" />
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <meta name="theme-color" content="#1d2023" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" type="text/css" href="<?php echo e($css); ?>" />
    <?php if($modx->getConfig('show_picker')): ?>
        <link rel="stylesheet" href="media/style/common/spectrum/spectrum.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo e(ManagerTheme::getThemeUrl()); ?>css/color.switcher.css" />
    <?php endif; ?>
    <link rel="icon" type="image/ico" href="<?php echo e(ManagerTheme::getStyle('favicon')); ?>" />
    <style>
        #tree { width: <?php echo e($MODX_widthSideBar); ?>rem }
        #main, #resizer { left: <?php echo e($MODX_widthSideBar); ?>rem }
        .ios #main { -webkit-overflow-scrolling: touch; overflow-y: scroll; }
    </style>
    <script type="text/javascript">
        if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
            document.documentElement.className += ' ios';
        }
    </script>
    <script src="media/script/jquery/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        // GLOBAL variable modx
        var modx = {
            MGR_DIR: '<?php echo e(MGR_DIR); ?>',
            MODX_SITE_URL: '<?php echo e(MODX_SITE_URL); ?>',
            MODX_MANAGER_URL: '<?php echo e(MODX_MANAGER_URL); ?>',
            user: {
                role: <?php echo e((int)$user['role']); ?>,
                username: '<?php echo e($user['username']); ?>'
            },
            config: {
                mail_check_timeperiod: <?php echo e($modx->getConfig('mail_check_timeperiod')); ?>,
                menu_height: <?php echo e((int)$modx->getConfig('manager_menu_height')); ?>,
                tree_width: <?php echo e((int)$MODX_widthSideBar); ?>,
                tree_min_width: <?php echo e((int)$tree_min_width); ?>,
                session_timeout: <?php echo e((int)$modx->getConfig('session_timeout')); ?>,
                site_start: <?php echo e((int)$modx->getConfig('site_start')); ?>,
                tree_page_click: <?php echo e($modx->getConfig('tree_page_click')); ?>,
                theme: '<?php echo e(ManagerTheme::getTheme()); ?>',
                theme_mode: '<?php echo e(ManagerTheme::getThemeStyle()); ?>',
                which_browser: '<?php echo e($user['which_browser']); ?>',
                layout: <?php echo e((int)$modx->getConfig('manager_layout')); ?>,
                textdir: '<?php echo e(ManagerTheme::getTextDir()); ?>',
                global_tabs: <?php echo e((int)$modx->getConfig('global_tabs')); ?>


            },
            lang: {
                already_deleted: "<?php echo e(ManagerTheme::getLexicon('already_deleted')); ?>",
                cm_unknown_error: "<?php echo e(ManagerTheme::getLexicon('cm_unknown_error')); ?>",
                collapse_tree: "<?php echo e(ManagerTheme::getLexicon('collapse_tree')); ?>",
                confirm_delete_resource: "<?php echo e(ManagerTheme::getLexicon('confirm_delete_resource')); ?>",
                confirm_empty_trash: "<?php echo e(ManagerTheme::getLexicon('confirm_empty_trash')); ?>",
                confirm_publish: "<?php echo e(ManagerTheme::getLexicon('confirm_publish')); ?>",
                confirm_remove_locks: "<?php echo e(ManagerTheme::getLexicon('confirm_remove_locks')); ?>",
                confirm_resource_duplicate: "<?php echo e(ManagerTheme::getLexicon('confirm_resource_duplicate')); ?>",
                confirm_undelete: "<?php echo e(ManagerTheme::getLexicon('confirm_undelete')); ?>",
                confirm_unpublish: "<?php echo e(ManagerTheme::getLexicon('confirm_unpublish')); ?>",
                empty_recycle_bin: "<?php echo e(ManagerTheme::getLexicon('empty_recycle_bin')); ?>",
                empty_recycle_bin_empty: "<?php echo e(ManagerTheme::getLexicon('empty_recycle_bin_empty')); ?>",
                error_no_privileges: "<?php echo e(ManagerTheme::getLexicon('error_no_privileges')); ?>",
                expand_tree: "<?php echo e(ManagerTheme::getLexicon('expand_tree')); ?>",
                inbox: "<?php echo e(ManagerTheme::getLexicon('inbox')); ?>",
                loading_doc_tree: "<?php echo e(ManagerTheme::getLexicon('loading_doc_tree')); ?>",
                loading_menu: "<?php echo e(ManagerTheme::getLexicon('loading_menu')); ?>",
                not_deleted: "<?php echo e(ManagerTheme::getLexicon('not_deleted')); ?>",
                unable_set_link: "<?php echo e(ManagerTheme::getLexicon('unable_set_link')); ?>",
                unable_set_parent: "<?php echo e(ManagerTheme::getLexicon('unable_set_parent')); ?>",
                working: "<?php echo e(ManagerTheme::getLexicon('working')); ?>",
                paging_prev: "<?php echo e(ManagerTheme::getLexicon('paging_prev')); ?>"
            },
            style: {
                actions_file:             '<?= addslashes($_style['icon_file']) ?>',
                actions_pencil:           '<?= addslashes($_style['icon_pencil']) ?>',
                actions_plus:             '<?= addslashes($_style['icon_plus']) ?>',
                actions_reply:            '<?= addslashes($_style['icon_reply']) ?>',
                collapse_tree:            '<?= addslashes('<i class="' . $_style['icon_arrow_up_circle'] . '"></i>') ?>',
                email:                    '<?= addslashes('<i class="' . $_style['icon_mail'] . '"></i>') ?>',
                expand_tree:              '<?= addslashes('<i class="' . $_style['icon_arrow_down_circle'] . '"></i>') ?>',

                icon_angle_left:          '<?= addslashes($_style['icon_angle_left']) ?>',
                icon_angle_right:         '<?= addslashes($_style['icon_angle_right']) ?>',
                icon_chunk:               '<?= addslashes($_style['icon_chunk']) ?>',
                icon_circle:              '<?= addslashes($_style['icon_circle']) ?>',
                icon_code:                '<?= addslashes($_style['icon_code']) ?>',
                icon_edit:                '<?= addslashes($_style['icon_edit']) ?>',
                icon_element:             '<?= addslashes($_style['icon_element']) ?>',
                icon_folder:              '<?= addslashes('<i class="' . $_style['icon_folder'] . '"></i>') ?>',
                icon_plugin:              '<?= addslashes($_style['icon_plugin']) ?>',
                icon_refresh:             '<?= addslashes($_style['icon_refresh']) ?>',
                icon_spin:                '<?= addslashes($_style['icon_spin']) ?>',
                icon_template:            '<?= addslashes($_style['icon_template']) ?>',
                icon_trash:               '<?= addslashes('<i class="' . $_style['icon_trash'] . '"></i>') ?>',
                icon_trash_alt:           '<?= addslashes('<i class="' . $_style['icon_trash_alt'] . '"></i>') ?>',
                icon_tv:                  '<?= addslashes($_style['icon_tv']) ?>',
                icons_external_link:      '<?= addslashes('<i class="' . $_style['icon_external_link'] . '"></i>') ?>',
                icons_working:            '<?= addslashes('<i class="' . $_style['icon_info_triangle'] . '"></i>') ?>',

                tree_folder:              '<?= addslashes('<i class="' . $_style['icon_folder'] . '"></i>') ?>',
                tree_folder_secure:       '<?= addslashes('<i class="' . $_style['icon_folder'] . '"></i>') ?>',
                tree_folderopen:          '<?= addslashes('<i class="' . $_style['icon_folder_open'] . '"></i>') ?>',
                tree_folderopen_secure:   '<?= addslashes('<i class="' . $_style['icon_folder_open'] . '"></i>') ?>',
                tree_info:                '<?= addslashes('<i class="' . $_style['icon_info_circle'] . '"></i>') ?>',
                tree_minusnode:           '<?= addslashes('<i class="' . $_style["icon_angle_down"] . '"></i>') ?>',
                tree_plusnode:            '<?= addslashes('<i class="' . $_style['icon_angle_right'] . '"></i>') ?>',
                tree_preview_resource:    '<?= addslashes('<i class="' . $_style['icon_eye'] . '"></i>') ?>'
            },
            permission: {
                assets_images: <?= $modx->hasPermission('assets_images') ? 1 : 0 ?>,
                delete_document: <?= $modx->hasPermission('delete_document') ? 1 : 0 ?>,
                edit_chunk: <?= $modx->hasPermission('edit_chunk') ? 1 : 0 ?>,
                edit_plugin: <?= $modx->hasPermission('edit_plugin') ? 1 : 0 ?>,
                edit_snippet: <?= $modx->hasPermission('edit_snippet') ? 1 : 0 ?>,
                edit_template: <?= $modx->hasPermission('edit_template') ? 1 : 0 ?>,
                messages: <?= $modx->hasPermission('messages') ? 1 : 0 ?>,
                new_document: <?= $modx->hasPermission('new_document') ? 1 : 0 ?>,
                publish_document: <?= $modx->hasPermission('publish_document') ? 1 : 0 ?>,
                dragndropdocintree: <?= ($modx->hasPermission('new_document') && $modx->hasPermission('edit_document') && $modx->hasPermission('save_document') ? 1 : 0) ?>

            },
            plugins: {
                ElementsInTree: <?= isset($modx->pluginCache['ElementsInTree']) ? 1 : 0 ?>,
                EVOmodal: <?= isset($modx->pluginCache['EVO.modal']) ? 1 : 0 ?>

            },
            extend: function() {
                for (var i = 1; i < arguments.length; i++) {
                    for (var key in arguments[i]) {
                        if (arguments[i].hasOwnProperty(key)) {
                            arguments[0][key] = arguments[i][key];
                        }
                    }
                }
                return arguments[0];
            },
            extended: function(a) {
                for (var b in a) {
                    this[b] = a[b];
                }
                delete a[b];
            },
            openedArray: [],
            lockedElementsTranslation: <?= json_encode($unlockTranslations, JSON_FORCE_OBJECT | JSON_UNESCAPED_UNICODE) . "\n" ?>
        };
        <?php
        $opened = array_filter(
            array_map(
                'intval',
                explode(
                    '|',
                    isset($_SESSION['openedArray']) && is_scalar($_SESSION['openedArray']) ? $_SESSION['openedArray'] : ''
                )
            )
        );
        echo (empty($opened) ? '' : 'modx.openedArray[' . implode("] = 1;\n		modx.openedArray[", $opened) . '] = 1;') . "\n";
        ?>
    </script>
    <script src="<?php echo e(ManagerTheme::getThemeUrl()); ?>js/modx.min.js?v=<?php echo e(EVO_INSTALL_TIME); ?>"></script>
    <?php if($modx->getConfig('show_picker')): ?>
    <script src="media/script/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="media/script/spectrum/spectrum.evo.min.js" type="text/javascript"></script>
    <script src="<?php echo e(ManagerTheme::getThemeUrl()); ?>js/color.switcher.js" type="text/javascript"></script>
    <?php endif; ?>
    <?php
    // invoke OnManagerTopPrerender event
    $evtOut = $modx->invokeEvent('OnManagerTopPrerender', $_REQUEST);
    if (is_array($evtOut)) {
        echo implode("\n", $evtOut);
    }
    ?>
</head>
<body class="<?php echo e($body_class); ?>">
<input type="hidden" name="sessToken" id="sessTokenInput" value="<?= isset($_SESSION['mgrToken']) ? $_SESSION['mgrToken'] : '' ?>" />
<div id="frameset">
    <div id="mainMenu" class="dropdown">
        <div class="container">
            <div class="row">
                <div class="cell" data-evocp="bgmColor">
                <?php echo $menu; ?>

                </div>
                <div class="cell" data-evocp="bgmColor">
                    <ul id="settings" class="nav">
                        <li id="searchform">
                            <form action="index.php?a=71" method="post" target="main">
                                <input type="hidden" value="Search" name="submitok" />
                                <label for="searchid" class="label_searchid">
                                    <i class="<?php echo e($_style['icon_search']); ?>"></i>
                                </label>
                                <input type="text" id="searchid" name="searchid" size="25" />
                                <div class="mask"></div>
                            </form>
                        </li>
                        <?php if($modx->getConfig('show_newresource_btn') && $modx->hasPermission('new_document')): ?>
                            <li id="newresource" class="dropdown newresource">
                                <a href="javascript:;" class="dropdown-toggle" onclick="return false;" title="<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>"><i class="<?php echo e($_style['icon_plus']); ?>"></i></a>
                                <ul class="dropdown-menu">
                                    <?php if($modx->hasPermission('new_document')): ?>
                                    <li>
                                        <a onclick="" href="index.php?a=4" target="main">
                                            <i class="<?php echo e($_style['icon_document']); ?>"></i><?php echo e(ManagerTheme::getLexicon('add_resource')); ?>

                                        </a>
                                    </li>
                                    <li>
                                        <a onclick="" href="index.php?a=72" target="main">
                                            <i class="<?php echo e($_style['icon_chain']); ?>"></i><?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>

                                        </a>
                                    </li>
                                    <?php endif; ?>
                                    <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_images')): ?>
                                        <li>
                                            <a onclick="" href="media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?&type=images" target="main">
                                                <i class="<?php echo e($_style['icon_camera']); ?>"></i><?php echo e(ManagerTheme::getLexicon('images_management')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_files')): ?>
                                        <li>
                                            <a onclick="" href="media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?&type=files" target="main">
                                                <i class="<?php echo e($_style['icon_files']); ?>"></i><?php echo e(ManagerTheme::getLexicon('files_management')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </li>
                        <?php endif; ?>
                        <li id="preview">
                            <a href="../" target="_blank" title="<?php echo e(ManagerTheme::getLexicon('preview')); ?>">
                                <i class="<?php echo e($_style['icon_desktop']); ?>"></i>
                            </a>
                        </li>
                        <li id="account" class="dropdown account">
                            <a href="javascript:;" class="dropdown-toggle" onclick="return false;">
                                <span class="username"><?= entities($user['username'], $modx->getConfig('modx_charset')) ?></span>
                                <?php if($user['photo']): ?>
                                <span class="icon photo" style="background-image: url(<?= MODX_SITE_URL . entities($user['photo'], $modx->getConfig('modx_charset')) ?>);"></span>
                                <?php else: ?>
                                <span class="icon"><i class="<?php echo e($_style['icon_user']); ?>"></i></span>
                                <?php endif; ?>
                                <i id="msgCounter"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <?php if($modx->hasPermission('messages')): ?>
                                <li id="newMail"></li>
                                <?php endif; ?>
                                <?php if($modx->hasPermission('change_password')): ?>
                                <li>
                                    <a onclick="" href="index.php?a=28" target="main">
                                        <i class="<?php echo e($_style['icon_lock']); ?>"></i><?php echo e(ManagerTheme::getLexicon('change_password')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>
                                <li>
                                    <a href="index.php?a=8">
                                        <i class="<?php echo e($_style['icon_logout']); ?>"></i><?php echo e(ManagerTheme::getLexicon('logout')); ?>

                                    </a>
                                </li>
                            </ul>
                        </li>
                        <?php if($modx->hasPermission('settings') || $modx->hasPermission('view_eventlog') || $modx->hasPermission('logs') || $modx->hasPermission('help')): ?>
                        <li id="system" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle" title="<?php echo e(ManagerTheme::getLexicon('system')); ?>" onclick="return false;"><i class="<?php echo e($_style['icon_cogs']); ?>"></i></a>
                            <ul class="dropdown-menu">
                                <?php if($modx->hasPermission('settings')): ?>
                                <li>
                                    <a href="index.php?a=17" target="main">
                                        <i class="<?php echo e($_style['icon_sliders']); ?>"></i><?php echo e(ManagerTheme::getLexicon('edit_settings')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if($modx->hasPermission('view_eventlog')): ?>
                                <li>
                                    <a href="index.php?a=70" target="main">
                                        <i class="<?php echo e($_style['icon_calendar']); ?>"></i><?php echo e(ManagerTheme::getLexicon('site_schedule')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if($modx->hasPermission('view_eventlog')): ?>
                                <li>
                                    <a href="index.php?a=114" target="main">
                                        <i class="<?php echo e($_style['icon_info_triangle']); ?>"></i><?php echo e(ManagerTheme::getLexicon('eventlog_viewer')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if($modx->hasPermission('logs')): ?>
                                <li>
                                    <a href="index.php?a=13" target="main">
                                        <i class="<?php echo e($_style['icon_user_secret']); ?>"></i><?php echo e(ManagerTheme::getLexicon('view_logging')); ?>

                                    </a>
                                </li>
                                <li>
                                    <a href="index.php?a=53" target="main">
                                        <i class="<?php echo e($_style['icon_info_circle']); ?>"></i><?php echo e(ManagerTheme::getLexicon('view_sysinfo')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>
                                <?php if($modx->hasPermission('help')): ?>
                                <li>
                                    <a href="index.php?a=9" target="main">
                                        <i class="<?php echo e($_style['icon_question_circle']); ?>"></i><?php echo e(ManagerTheme::getLexicon('help')); ?>

                                    </a>
                                </li>
                                <?php endif; ?>

                                <?php
                                $style = $modx->getConfig('settings_version') !== $modx->getVersionData('version') ? 'style="color:#ffff8a;"' : '';
                                $version = 'Evolution CMS';
                                echo sprintf('<li><span class="dropdown-item" title="%s &ndash; %s" %s>' . $version . ' %s</span></li>', $modx->getPhpCompat()->entities($modx->getConfig('site_name')), $modx->getVersionData('full_appname'), $style, $modx->getConfig('settings_version'));
                                ?>
                            </ul>
                        </li>
                        <?php endif; ?>
                        <?php if($modx->getConfig('show_fullscreen_btn')): ?>
                            <li id="fullscreen">
                                <a href="javascript:;" onclick="toggleFullScreen();" id="toggleFullScreen" title="<?php echo e(ManagerTheme::getLexicon('toggle_fullscreen')); ?>">
                                    <i class="<?php echo e($_style['icon_expand']); ?>"></i>
                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="tree"><?php echo $__env->make('manager::frame.tree', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?></div>
    <div id="main">
        <?php if($modx->getConfig('global_tabs')): ?>
            <div class="tab-row-container evo-tab-row">
                <div class="tab-row"><h2 id="evo-tab-home" class="tab selected" data-target="evo-tab-page-home"><i class="<?php echo e($_style['icon_home']); ?>"></i></h2></div>
            </div>
            <div id="evo-tab-page-home" class="evo-tab-page show iframe-scroller">
                <iframe id="mainframe" src="index.php?a=<?php echo e($initMainframeAction); ?>" scrolling="auto" frameborder="0" onload="modx.main.onload(event);"></iframe>
            </div>
        <?php else: ?>
            <div class="iframe-scroller">
                <iframe id="mainframe" name="main" src="index.php?a=<?php echo e($initMainframeAction); ?>" scrolling="auto" frameborder="0" onload="modx.main.onload(event);"></iframe>
            </div>
        <?php endif; ?>
        <script>
            if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
                document.getElementById('mainframe').setAttribute('scrolling', 'no');
                document.getElementsByClassName("tabframes").setAttribute("scrolling", "no");
            }
        </script>
        <div id="mainloader"></div>
    </div>
    <div id="resizer"></div>
    <div id="searchresult"></div>

    <div id="floater" class="dropdown">
        <?php
        $sortParams = array(
            'tree_sortby',
            'tree_sortdir',
            'tree_nodename'
        );
        foreach ($sortParams as $param) {
            if (isset($_REQUEST[$param])) {
                $modx->getManagerApi()->saveLastUserSetting($param, $_REQUEST[$param]);
                $_SESSION[$param] = $_REQUEST[$param];
            } else if (!isset($_SESSION[$param])) {
                $_SESSION[$param] = $modx->getManagerApi()->getLastUserSetting($param);
            }
        }
        ?>
        <form name="sortFrm" id="sortFrm">
            <div class="form-group">
                <input type="hidden" name="dt" value="<?= (isset($_REQUEST['dt']) ? htmlspecialchars($_REQUEST['dt'])
                    : '') ?>" />
                <label><?php echo e(ManagerTheme::getLexicon('sort_tree')); ?></label>
                <select name="sortby" class="form-control">
                    <option value="isfolder" <?= $_SESSION['tree_sortby'] == 'isfolder' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('folder')); ?></option>
                    <option value="pagetitle" <?= $_SESSION['tree_sortby'] == 'pagetitle' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('pagetitle')); ?></option>
                    <option value="longtitle" <?= $_SESSION['tree_sortby'] == 'longtitle' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('long_title')); ?></option>
                    <option value="id" <?= $_SESSION['tree_sortby'] == 'id' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('id')); ?></option>
                    <option value="menuindex" <?= $_SESSION['tree_sortby'] == 'menuindex' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('resource_opt_menu_index')); ?></option>
                    <option value="createdon" <?= $_SESSION['tree_sortby'] == 'createdon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('createdon')); ?></option>
                    <option value="editedon" <?= $_SESSION['tree_sortby'] == 'editedon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('editedon')); ?></option>
                    <option value="publishedon" <?= $_SESSION['tree_sortby'] == 'publishedon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('page_data_publishdate')); ?></option>
                    <option value="alias" <?= $_SESSION['tree_sortby'] == 'alias' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('page_data_alias')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <select name="sortdir" class="form-control">
                    <option value="DESC" <?= $_SESSION['tree_sortdir'] == 'DESC' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('sort_desc')); ?></option>
                    <option value="ASC" <?= $_SESSION['tree_sortdir'] == 'ASC' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('sort_asc')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <label><?php echo e(ManagerTheme::getLexicon('setting_resource_tree_node_name')); ?></label>
                <select name="nodename" class="form-control">
                    <option value="default" <?= $_SESSION['tree_nodename'] == 'default' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('default')); ?></option>
                    <option value="pagetitle" <?= $_SESSION['tree_nodename'] == 'pagetitle' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('pagetitle')); ?></option>
                    <option value="longtitle" <?= $_SESSION['tree_nodename'] == 'longtitle' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('long_title')); ?></option>
                    <option value="menutitle" <?= $_SESSION['tree_nodename'] == 'menutitle' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('resource_opt_menu_title')); ?></option>
                    <option value="alias" <?= $_SESSION['tree_nodename'] == 'alias' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('alias')); ?></option>
                    <option value="createdon" <?= $_SESSION['tree_nodename'] == 'createdon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('createdon')); ?></option>
                    <option value="editedon" <?= $_SESSION['tree_nodename'] == 'editedon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('editedon')); ?></option>
                    <option value="publishedon" <?= $_SESSION['tree_nodename'] == 'publishedon' ? "selected='selected'" : "" ?>><?php echo e(ManagerTheme::getLexicon('page_data_publishdate')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <label>
                    <input type="checkbox" name="showonlyfolders" value="<?= ($_SESSION['tree_show_only_folders'] ? 1 : '') ?>" onclick="this.value = (this.value ? '' : 1);" <?= ($_SESSION['tree_show_only_folders'] ? '' : ' checked="checked"') ?> /> <?php echo e(ManagerTheme::getLexicon('view_child_resources_in_container')); ?></label>
            </div>
            <div class="text-center">
                <a href="javascript:;" class="btn btn-primary" onclick="modx.tree.updateTree();modx.tree.showSorter(event);" title="<?php echo e(ManagerTheme::getLexicon('sort_tree')); ?>"><?php echo e(ManagerTheme::getLexicon('sort_tree')); ?></a>
            </div>
        </form>
    </div>

<?php
if(!function_exists('constructLink')) {
    /**
     * @param string $action
     * @param string $img
     * @param string $text
     * @param bool $allowed
     */
    function constructLink($action, $img, $text, $allowed)
    {
        if ((bool)$allowed) {
            echo sprintf('<div class="menuLink" id="item%s" onclick="modx.tree.menuHandler(%s);">', $action,
                $action);
            echo sprintf('<i class="%s"></i> %s</div>', $img, $text);
        }
    }
}
?>

<!-- Contextual Menu Popup Code -->
    <div id="mx_contextmenu" class="dropdown" onselectstart="return false;">
        <div id="nameHolder">&nbsp;</div>
        <?php
        constructLink(3, $_style['icon_document'], ManagerTheme::getLexicon('create_resource_here'), $modx->hasPermission('new_document')); // new Resource
        constructLink(2, $_style['icon_edit'] , ManagerTheme::getLexicon('edit_resource'), $modx->hasPermission('edit_document')); // edit
        constructLink(5, $_style['icon_move'], ManagerTheme::getLexicon('move_resource'), $modx->hasPermission('save_document')); // move
        constructLink(7, $_style['icon_clone'], ManagerTheme::getLexicon('resource_duplicate'), $modx->hasPermission('new_document')); // duplicate
        constructLink(11, $_style['icon_sort_num_asc'], ManagerTheme::getLexicon('sort_menuindex'), !!($modx->hasPermission('edit_document') && $modx->hasPermission('save_document'))); // sort menu index
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(9, $_style['icon_check'], ManagerTheme::getLexicon('publish_resource'), $modx->hasPermission('publish_document')); // publish
        constructLink(10, $_style['icon_close'], ManagerTheme::getLexicon('unpublish_resource'), $modx->hasPermission('publish_document')); // unpublish
        constructLink(4, $_style['icon_trash'], ManagerTheme::getLexicon('delete_resource'), $modx->hasPermission('delete_document')); // delete
        constructLink(8, $_style['icon_undo'], ManagerTheme::getLexicon('undelete_resource'), $modx->hasPermission('delete_document')); // undelete
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(6, $_style['icon_chain'], ManagerTheme::getLexicon('create_weblink_here'), $modx->hasPermission('new_document')); // new Weblink
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(1, $_style['icon_info'], ManagerTheme::getLexicon('resource_overview'), $modx->hasPermission('view_document')); // view
        constructLink(12, $_style['icon_eye'], ManagerTheme::getLexicon('preview_resource'), 1); // preview
        ?>

    </div>

    <script type="text/javascript">

        if (document.getElementById('treeMenu')) {
            <?php if($modx->hasPermission('edit_template') || $modx->hasPermission('edit_snippet') || $modx->hasPermission('edit_chunk') || $modx->hasPermission('edit_plugin')): ?>

            document.getElementById('treeMenu_openelements').onclick = function(e) {
                e.preventDefault();
                if (modx.config.global_tabs && !e.shiftKey) {
                    modx.tabs({url: '<?php echo e(MODX_MANAGER_URL); ?>index.php?a=76', title: '<?php echo e(ManagerTheme::getLexicon('elements')); ?>'});
                } else {
                    var randomNum = '<?php echo e(ManagerTheme::getLexicon('elements')); ?>';
                    if (e.shiftKey) {
                        randomNum += ' #' + Math.floor((Math.random() * 999999) + 1);
                    }
                    modx.openWindow({
                        url: '<?php echo e(MODX_MANAGER_URL); ?>index.php?a=76',
                        title: randomNum
                    });
                }
            };
            <?php endif; ?>
            <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_images')): ?>

            document.getElementById('treeMenu_openimages').onclick = function(e) {
                e.preventDefault();
                if (modx.config.global_tabs && !e.shiftKey) {
                    modx.tabs({url: '<?php echo e(MODX_MANAGER_URL); ?>media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?filemanager=media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php&type=images', title: '<?php echo e(ManagerTheme::getLexicon('images_management')); ?>'});
                } else {
                    var randomNum = '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>';
                    if (e.shiftKey) {
                        randomNum += ' #' + Math.floor((Math.random() * 999999) + 1);
                    }
                    modx.openWindow({
                        url: '<?php echo e(MODX_MANAGER_URL); ?>media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?&type=images',
                        title: randomNum
                    });
                }
            };
            <?php endif; ?>
            <?php if($modx->getConfig('use_browser') && $modx->hasPermission('assets_files')): ?>

            document.getElementById('treeMenu_openfiles').onclick = function(e) {
                e.preventDefault();
                if (modx.config.global_tabs && !e.shiftKey) {
                    modx.tabs({url: '<?php echo e(MODX_MANAGER_URL); ?>media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?filemanager=media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php&type=files', title: '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>'});
                } else {
                    var randomNum = '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>';
                    if (e.shiftKey) {
                        randomNum += ' #' + Math.floor((Math.random() * 999999) + 1);
                    }
                    modx.openWindow({
                        url: '<?php echo e(MODX_MANAGER_URL); ?>media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?&type=files',
                        title: randomNum
                    });
                }
            };
            <?php endif; ?>

        }

    </script>
    <?php if($modx->getConfig('show_fullscreen_btn')): ?>
        <script>
            function toggleFullScreen()
            {
                if ((document.fullScreenElement && document.fullScreenElement !== null) ||
                    (!document.mozFullScreen && !document.webkitIsFullScreen)) {
                    if (document.documentElement.requestFullScreen) {
                        document.documentElement.requestFullScreen();
                    } else if (document.documentElement.mozRequestFullScreen) {
                        document.documentElement.mozRequestFullScreen();
                    } else if (document.documentElement.webkitRequestFullScreen) {
                        document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                    }
                } else {
                    if (document.cancelFullScreen) {
                        document.cancelFullScreen();
                    } else if (document.mozCancelFullScreen) {
                        document.mozCancelFullScreen();
                    } else if (document.webkitCancelFullScreen) {
                        document.webkitCancelFullScreen();
                    }
                }
            }

            $('#toggleFullScreen').click(function() {
                var icon = $(this).find('i');
                icon.toggleClass('<?php echo e($_style['icon_expand']); ?> <?php echo e($_style['icon_compress']); ?>');
            });
        </script>
    <?php endif; ?>
    <?php echo $modx->invokeEvent('OnManagerFrameLoader', ['action' => ManagerTheme::getActionId()]);; ?>

</div>
<?php if($modx->getConfig('show_picker')): ?>
    <div class="evocp-box">
        <div class="evocp-icon"><i class="evocpicon <?php echo e($_style['icon_brush']); ?>" aria-hidden="true" ></i></div>
        <div class="evocp-frame">
            <h2>COLOR SWITCHER</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".bgmcolors"><i class="togglearrow <?php echo e($_style['icon_chevron_down']); ?>" aria-hidden="true"></i> <i class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu Background</h3><a title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;" onclick="cleanLocalStorageReloadAll('my_evo_bgmcolor')" class="pull-right resetcolor btn btn-secondary"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse in bgmcolors">
                    <div class="evocp-bgmcolors">
                        <div class="evocp-bgmcolor">#000</div>
                        <div class="evocp-bgmcolor">#222</div>
                        <div class="evocp-bgmcolor">#333</div>
                        <div class="evocp-bgmcolor">#444</div>
                        <div class="evocp-bgmcolor">#555</div>
                        <div class="evocp-bgmcolor">#777</div>
                        <div class="evocp-bgmcolor">#888</div>
                        <div class="evocp-bgmcolor">#0f243e</div>
                        <div class="evocp-bgmcolor">#548dd4</div>
                        <div class="evocp-bgmcolor">#134f5c</div>
                        <div class="evocp-bgmcolor">#0b5394</div>
                        <div class="evocp-bgmcolor">#351c75</div>
                        <div class="evocp-bgmcolor">#741b47</div>
                        <div class="evocp-bgmcolor">#900</div>
                    </div>
                    <input type="color" class="color" id="bgmPicker" name="evocpCustombgmColor" value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 span data-toggle="collapse" data-target=".menuColors"><i class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu links</h3> <a title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;" onclick="cleanLocalStorageReloadMain('my_evo_menuColor')" class="pull-right resetcolor btn btn-secondary"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse menuColors">
                    <div class="evocp-menuColors">
                        <div class="evocp-menuColor">#000</div>
                        <div class="evocp-menuColor">#222</div>
                        <div class="evocp-menuColor">#555</div>
                        <div class="evocp-menuColor">#666</div>
                        <div class="evocp-menuColor evocp_light">#dedede</div>
                        <div class="evocp-menuColor evocp_light">#fafafa</div>
                        <div class="evocp-menuColor evocp_light">#fff</div>
                        <div class="evocp-menuColor">#b45f06</div>
                        <div class="evocp-menuColor">#38761d</div>
                        <div class="evocp-menuColor">#134f5c</div>
                        <div class="evocp-menuColor">#0b5394</div>
                        <div class="evocp-menuColor">#351c75</div>
                        <div class="evocp-menuColor">#741b47</div>
                        <div class="evocp-menuColor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="menucolorPicker" name="evocpCustommenuColor" value="#cf2626" placeholder="color code...">
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".menuHColors"><i class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu links:hover </h3><a title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;" onclick="cleanLocalStorageReloadMain('my_evo_menuHColor')" class="pull-right resetcolor btn btn-secondary"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse menuHColors">
                    <div class="evocp-menuHColors">
                        <div class="evocp-menuHColor">#000</div>
                        <div class="evocp-menuHColor">#222</div>
                        <div class="evocp-menuHColor">#555</div>
                        <div class="evocp-menuHColor">#666</div>
                        <div class="evocp-menuHColor evocp_light">#dedede</div>
                        <div class="evocp-menuHColor evocp_light">#fafafa</div>
                        <div class="evocp-menuHColor evocp_light">#fff</div>
                        <div class="evocp-menuHColor">#b45f06</div>
                        <div class="evocp-menuHColor">#38761d</div>
                        <div class="evocp-menuHColor">#134f5c</div>
                        <div class="evocp-menuHColor">#0b5394</div>
                        <div class="evocp-menuHColor">#351c75</div>
                        <div class="evocp-menuHColor">#741b47</div>
                        <div class="evocp-menuHColor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="menuHcolorPicker" name="evocpCustommenuHColor" value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".cpcolors"><i class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i class="<?php echo e($_style['icon_font']); ?>" aria-hidden="true"></i> Text color </h3><a title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;" onclick="cleanLocalStorageReloadMain('my_evo_color')" class="pull-right resetcolor btn btn-secondary"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse cpcolors">
                    <div class="evocp-colors">
                        <div class="evocp-color">#000</div>
                        <div class="evocp-color">#222</div>
                        <div class="evocp-color">#333</div>
                        <div class="evocp-color">#444</div>
                        <div class="evocp-color">#555</div>
                        <div class="evocp-color">#777</div>
                        <div class="evocp-color">#888</div>
                        <div class="evocp-color">#b45f06</div>
                        <div class="evocp-color">#38761d</div>
                        <div class="evocp-color">#134f5c</div>
                        <div class="evocp-color">#0b5394</div>
                        <div class="evocp-color">#351c75</div>
                        <div class="evocp-color">#741b47</div>
                        <div class="evocp-color">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="textcolorPicker" name="textcolorPicker" value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".alinkcolors"><i class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i class="<?php echo e($_style['icon_chain']); ?>" aria-hidden="true"></i> Links Color</h3> <a title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;" onclick="cleanLocalStorageReloadMain('my_evo_alinkcolor')" class="pull-right resetcolor btn btn-secondary"><i class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse alinkcolors">
                    <div class="evocp-alinkcolors">
                        <div class="evocp-alinkcolor">#000</div>
                        <div class="evocp-alinkcolor">#222</div>
                        <div class="evocp-alinkcolor">#555</div>
                        <div class="evocp-alinkcolor">#666</div>
                        <div class="evocp-alinkcolor">#dedede</div>
                        <div class="evocp-alinkcolor">#fafafa</div>
                        <div class="evocp-alinkcolor">#fff</div>
                        <div class="evocp-alinkcolor">#b45f06</div>
                        <div class="evocp-alinkcolor">#38761d</div>
                        <div class="evocp-alinkcolor">#134f5c</div>
                        <div class="evocp-alinkcolor">#0b5394</div>
                        <div class="evocp-alinkcolor">#351c75</div>
                        <div class="evocp-alinkcolor">#741b47</div>
                        <div class="evocp-alinkcolor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="linkcolorPicker" name="alinkcolorPicker" value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <hr/>
            <input type="reset" onclick="cleanLocalStorageReloadAll('my_evo_alinkcolor,my_evo_menuColor,my_evo_menuHColor,my_evo_bgmcolor,my_evo_color')" class="btn btn-secondary" value="<?php echo e(ManagerTheme::getLexicon('reset')); ?>">
        </div>
    </div>
    <script>
        $("#bgmPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'bgmPicker',
            showInput: true,
            allowEmpty:true
        });
        $("#menucolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'menucolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty:true
        });
        $("#menuHcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'menuHcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty:true
        });
        $("#textcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'textcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty:true
        });
        $("#linkcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'linkcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty:true
        });
    </script>
<?php endif; ?>
</body>
</html>
<?php /**PATH E:/OSPanel/domains/evo20/manager//views//frame/1.blade.php ENDPATH**/ ?>