<?php











namespace Composer\Util;

use Composer\Config;
use Composer\IO\IOInterface;




class Url
{
public static function updateDistReference(Config $config, $url, $ref)
{
$host = parse_url($url, PHP_URL_HOST);

if ($host === 'api.github.com' || $host === 'github.com' || $host === 'www.github.com') {
if (preg_match('{^https?://(?:www\.)?github\.com/([^/]+)/([^/]+)/(zip|tar)ball/(.+)$}i', $url, $match)) {

 $url = 'https://api.github.com/repos/' . $match[1] . '/'. $match[2] . '/' . $match[3] . 'ball/' . $ref;
} elseif (preg_match('{^https?://(?:www\.)?github\.com/([^/]+)/([^/]+)/archive/.+\.(zip|tar)(?:\.gz)?$}i', $url, $match)) {

 $url = 'https://api.github.com/repos/' . $match[1] . '/'. $match[2] . '/' . $match[3] . 'ball/' . $ref;
} elseif (preg_match('{^https?://api\.github\.com/repos/([^/]+)/([^/]+)/(zip|tar)ball(?:/.+)?$}i', $url, $match)) {

 $url = 'https://api.github.com/repos/' . $match[1] . '/'. $match[2] . '/' . $match[3] . 'ball/' . $ref;
}
} elseif ($host === 'bitbucket.org' || $host === 'www.bitbucket.org') {
if (preg_match('{^https?://(?:www\.)?bitbucket\.org/([^/]+)/([^/]+)/get/(.+)\.(zip|tar\.gz|tar\.bz2)$}i', $url, $match)) {

 $url = 'https://bitbucket.org/' . $match[1] . '/'. $match[2] . '/get/' . $ref . '.' . $match[4];
}
} elseif ($host === 'gitlab.com' || $host === 'www.gitlab.com') {
if (preg_match('{^https?://(?:www\.)?gitlab\.com/api/v[34]/projects/([^/]+)/repository/archive\.(zip|tar\.gz|tar\.bz2|tar)\?sha=.+$}i', $url, $match)) {

 $url = 'https://gitlab.com/api/v4/projects/' . $match[1] . '/repository/archive.' . $match[2] . '?sha=' . $ref;
}
} elseif (in_array($host, $config->get('github-domains'), true)) {
$url = preg_replace('{(/repos/[^/]+/[^/]+/(zip|tar)ball)(?:/.+)?$}i', '$1/'.$ref, $url);
} elseif (in_array($host, $config->get('gitlab-domains'), true)) {
$url = preg_replace('{(/api/v[34]/projects/[^/]+/repository/archive\.(?:zip|tar\.gz|tar\.bz2|tar)\?sha=).+$}i', '${1}'.$ref, $url);
}

return $url;
}
}
