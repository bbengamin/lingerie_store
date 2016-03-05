<?php
class ControllerModulePriceFilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$category_id = end($parts);

		$this->load->model('catalog/category');
		
		$this->load->model('localisation/currency');

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->load->language('module/price_filter');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_filter'] = $this->language->get('button_filter');

			$url = '';
			$this->document->addScript('//code.jquery.com/ui/1.11.1/jquery-ui.js');
			$this->document->addScript('catalog/view/javascript/slider/slider.js');
			$this->document->addStyle('catalog/view/javascript/slider/slider.css');
			$this->document->addStyle('//code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css');
			

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));

			if (isset($this->request->get['price_range'])) {
				$data['price_range'] = explode('-', $this->request->get['price_range']);
			} else {
				$data['price_range'] = array();
			}
			
			if ($this->currency->getSymbolLeft($this->currency->getCode())) {
				$code = $this->currency->getSymbolLeft($this->currency->getCode());
				$data['right_code'] = false;
			} else {
				$code = $this->currency->getSymbolRight($this->currency->getCode());
				$data['right_code'] = true;
			}
			
			$data['price_code'] = $code;
			$range = explode('-',$this->config->get('price_filter_range'));
			$data['price_range_min'] = $this->currency->convert($range[0],'XYZ',$this->currency->getCode());
			$data['price_range_max'] = $this->currency->convert($range[1],'XYZ',$this->currency->getCode());
			$data['product_class'] = $this->config->get('price_filter_class');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/price_filter.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/price_filter.tpl', $data);
			} else {
				return $this->load->view('default/template/module/price_filter.tpl', $data);
			}
			
		}
	}
	
}