<?php
class Helper_FormularioCampo
{
	public function formularioCampo( $params )
	{
		$xhtml  = '<div>';
		$xhtml .= ' <label for="'.$params['label'].'">'.$params['text'].':&nbsp;</label>'; 
		$xhtml .= ' <input type="text" name="'.$params['label'].'" size="'.$params['size'].'" value="'.$params['value'].'"/>';
		$xhtml .= '</div>'; 
		return $xhtml;
	}
}