class ProcessImage {
  static String processImageLink(link) {
    if (link == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Caution_sign_used_on_roads_pn.svg/1200px-Caution_sign_used_on_roads_pn.svg.png';
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
