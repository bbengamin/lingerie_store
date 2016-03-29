<footer>
  <div class="container">
    <div class="row">
      <!-- <?php if ($informations) { ?> -->
      <div class="col-sm-3">
        <h5>Информация</h5>
        <ul class="list-unstyled">
         <!--  <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?> -->
          <li><a href="/index.php?route=information/information&information_id=9">О нас</a></li>
          <li><a href="/index.php?route=information/information&information_id=4">Контакты</a></li>
          <li><a href="/index.php?route=information/information&information_id=10">Новости</a></li>
        </ul>
      </div>
      <!-- <?php } ?> -->
      <div class="col-sm-3">
        <h5>Служба поддержки</h5>
        <ul class="list-unstyled">
          <li><a href="/index.php?route=information/information&information_id=3">Способы оплаты</a></li>
          <li><a href="/index.php?route=information/information&information_id=3">Доставка</a></li>
          <li><a href="/index.php?route=information/information&information_id=6">Возврат и обмен</a></li>
          <li><a href="/index.php?route=information/information&information_id=5">Как сделать заказ</a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5>Дополнительно</h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>">Производители</a></li>
          <li><a href="/index.php?route=information/information&information_id=7">Как подобрать размер</a></li>
          <li><a href="/index.php?route=information/information&information_id=8">Сотрудничество</a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>

</body></html>