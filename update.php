<?php
function downloadFile(
    $url,
    $path
) {
    $newfname = $path;
    $file = null;
    $newf = null;
    try {
        if (ini_get("allow_url_fopen")) {
            $file = fopen($url, "rb");
            if ($file) {
                $newf = fopen($newfname, "wb");
                if ($newf) {
                    while (!feof($file)) {
                        fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
                    }
                }
            }
        } elseif (function_exists("curl_version")) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
            $content = curl_exec($ch);
            curl_close($ch);
            file_put_contents($newfname, $content);
        }
    } catch (Exception $e) {
        $this->errors[] = array("ERROR:Download", $e->getMessage());
        return false;
    }
    if ($file) {
        fclose($file);
    }

    if ($newf) {
        fclose($newf);
    }

    return true;
}

function removeFolder($path)
{
    $dir = realpath($path);
    if (!is_dir($dir)) {
        return;
    }

    $it = new RecursiveDirectoryIterator($dir);
    $files = new RecursiveIteratorIterator($it, RecursiveIteratorIterator::CHILD_FIRST);
    foreach ($files as $file) {
        if ($file->getFilename() === "." || $file->getFilename() === "..") {
            continue;
        }
        if ($file->isDir()) {
            rmdir($file->getRealPath());
        } else {
            unlink($file->getRealPath());
        }
    }
    rmdir($dir);
}

function copyFolder(
    $src,
    $dest
) {
    $path = realpath($src);
    $dest = realpath($dest);
    $objects = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path), RecursiveIteratorIterator::SELF_FIRST);
    foreach ($objects as $name => $object) {

        $startsAt = substr(dirname($name), strlen($path));
        mmkDir($dest . $startsAt);
        if ($object->isDir()) {
            mmkDir($dest . substr($name, strlen($path)));
        }

        if (is_writable($dest . $startsAt) and $object->isFile()) {
            copy((string)$name, $dest . $startsAt . DIRECTORY_SEPARATOR . basename($name));
        }
    }
}

function mmkDir(
    $folder,
    $perm = 0777
) {
    if (!is_dir($folder)) {
        mkdir($folder, $perm);
    }
}

$version = "evolution-cms/evolution";

downloadFile("https://github.com/" . $version . "/archive/" . $_GET["version"] . ".zip", "evo.zip");
$zip = new ZipArchive;
$res = $zip->open(__DIR__ . "/evo.zip");
$zip->extractTo(__DIR__ . "/temp");
$zip->close();

if ($handle = opendir(__DIR__ . "/temp")) {
    while (false !== ($name = readdir($handle))) {
        if ($name != "." && $name != "..") {
            $dir = $name;
        }
    }
    closedir($handle);
}
removeFolder(__DIR__ . "/temp/" . $dir . "/install/assets/chunks");
removeFolder(__DIR__ . "/temp/" . $dir . "/install/assets/tvs");
removeFolder(__DIR__ . "/temp/" . $dir . "/install/assets/templates");
unlink(__DIR__ . "/temp/" . $dir . "/ht.access");
unlink(__DIR__ . "/temp/" . $dir . "/README.md");
unlink(__DIR__ . "/temp/" . $dir . "/sample-robots.txt");
unlink(__DIR__ . "/temp/" . $dir . "/composer.json");

if (is_file(__DIR__ . "/assets/cache/siteManager.php")) {

    unlink(__DIR__ . "/temp/" . $dir . "/assets/cache/siteManager.php");
    include_once(__DIR__ . "/assets/cache/siteManager.php");
    if (!defined("MGR_DIR")) {
        define("MGR_DIR", "manager");
    }
    if (MGR_DIR != "manager") {
        mmkDir(__DIR__ . "/temp/" . $dir . "/" . MGR_DIR);
        copyFolder(__DIR__ . "/temp/" . $dir . "/manager", __DIR__ . "/temp/" . $dir . "/" . MGR_DIR);
        removeFolder(__DIR__ . "/temp/" . $dir . "/manager");
    }
    // echo __DIR__."/temp/".$dir."/".MGR_DIR;
}
copyFolder(__DIR__ . "/temp/" . $dir, __DIR__ . "/");
removeFolder(__DIR__ . "/temp");
unlink(__DIR__ . "/evo.zip");
unlink(__DIR__ . "/update.php");
header("Location: http://evo20/install/index.php?action=mode");