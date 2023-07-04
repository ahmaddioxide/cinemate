class ProcessImage {
  static String processImageLink(link) {
    if (link == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Caution_sign_used_on_roads_pn.svg/1200px-Caution_sign_used_on_roads_pn.svg.png';
    }

    return 'https://image.tmdb.org/t/p/w500$link';
  }

  static String processPosterLink(link){
    if (link == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Caution_sign_used_on_roads_pn.svg/1200px-Caution_sign_used_on_roads_pn.svg.png';
    }

    return 'https://image.tmdb.org/t/p/original$link';
  }
}
