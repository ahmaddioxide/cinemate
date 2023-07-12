class ProcessImage {
  static String processImageLink(link) {
    if (link == null) {
      return 'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1';
    }

    return 'https://image.tmdb.org/t/p/w500$link';
  }

  static String processPosterLink(link){
    if (link == null) {
      return 'https://png.pngtree.com/png-vector/20190816/ourlarge/pngtree-film-logo-design-template-vector-isolated-illustration-png-image_1693431.jpg';
    }

    return 'https://image.tmdb.org/t/p/original$link';
  }
  static String processProfileImageLink(link){
    if (link == null) {
      return 'https://www.pngitem.com/pimgs/m/277-2771393_png-grey-person-transparent-png.png';
    }

    return 'https://image.tmdb.org/t/p/w500$link';
  }
}
