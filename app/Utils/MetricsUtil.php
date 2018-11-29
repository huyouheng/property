<?php
/**
 * Created by PhpStorm.
 * User: hyh
 * Date: 18-11-27
 * Time: 上午10:25
 */

namespace App\Utils;


use App\Models\Container;

class MetricsUtil
{
    public function parseFilesList($item, $id = null, $title = null)
    {
        if ($item == '*'){
            return '';
        }
        $html = '';
        if (trim($item)) {
            $items = json_decode($item, true);

            if (!$items){
                return '';
            }
            $media = new MediaUtil('files');
            foreach ($items as $item) {
                $html .= $media->getFilePreview($item);
            }
            $html .= $this->addFilesHtml($items, $id, $title);
        }
        return $html;
    }

    //解决单选
    public function parseSingleSelect($id)
    {
        if (is_null($container = Container::find($id))) {
            return '参数错误';
        }

        return $this->jsonToSelect($container->extral, $id);
    }

    //
    public function parseSingleJsonToSelect($extral, $select, $id)
    {

        return $this->jsonToSelect($extral, $id, $select);
    }

    private function jsonToSelect($extral, $id = null, $currentSelect = null)
    {
        $extral = explode('@^@', $extral);
        $select = '<select name="field_name[' . $id . ']" class="form-control">';
        foreach ($extral as $item) {
            if ($item == $currentSelect) {
                $select .= '<option selected value="' . $item . '">' . $item . '</option>';
            } else {
                $select .= '<option value="' . $item . '">' . $item . '</option>';
            }
        }
        $select .= '</select>';
        return $select;
    }

    private function addFilesHtml($json, $id = null, $title = null)
    {
//        $html = <<<EOF
// <div class="btn-group operation" style="position: absolute;right: 0;bottom: 0;opacity: 0;">
//<i class="material-icons" style="cursor: pointer;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
//<ul class="dropdown-menu">
//EOF;
//
//        foreach ($json as $key => $j) {
//            if ($key % 2 == 1) {
//                $html .= '<li style="line-height: 20px;text-align: center;border-top: 1px solid #e0d9d9;">' . substr($j, 9) . '</li><li class="text-center" style="border-bottom: 1px solid #e0d9d9;"><i class="fa fa-eye" style="cursor: pointer;"></i>&nbsp;<i class="fa fa-download" style="cursor: pointer;"></i>&nbsp;<i class="fa fa-trash" style="cursor: pointer;"></i></li>';
//            } else {
//                $html .= '<li style="line-height: 20px;text-align: center;">' . substr($j, 9) . '</li><li class="text-center"><i class="fa fa-eye" style="cursor: pointer;"></i>&nbsp;<i class="fa fa-download" style="cursor: pointer;"></i>&nbsp;<i class="fa fa-trash" style="cursor: pointer;"></i></li>';
//
//            }
//        }
//        $html .= '</ul></div>';
//        return $html;
        $info = [];
        foreach ($json as $key => $j) {
            $info [] = ['id' => $id, 'name' => substr($j, 9)];
        }

        $info = json_encode($info);
        $html = <<<EOF
 <div class="btn-group operation" style="position: absolute;right: 0;bottom: 0;opacity: 0;">        
<i class="material-icons waves-effect popup-extral-panel" style="cursor: pointer;" data-html='$info' data-title="$title">keyboard_arrow_down</i>
</div>
EOF;
        return $html;
    }
}