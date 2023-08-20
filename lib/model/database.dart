import 'package:ibanez_app/model/artist.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/news.dart';
import 'package:ibanez_app/pages/altbackup.dart';

List<Guitar> productList = [
  Guitar.signature(
    name: "PIA3761", 
    neckMat: "Maple/Walnut",
    bodyMat: "Alder",
    fretboardMat: "Rosewood",
    fretAmount: 24, 
    artist: "Steve Vai", 
    pickup: "DiMarzio Utopia", 
    price: 3999,
    description: "The newly designed PIA Blossom inlay is gorgeous, prominent, and elegantly imparts Steve Vai’s trademark style and artistic vision.",
    pickupDescription: "Based on Steve's latest tonal preferences, DiMarzio® UtoPIA™ pickups are voiced for smoother highs, more scooped mids, and more pronounced low-end. The pickups incorporate beautiful aesthetics and design elements meant to complement the cosmetic features of the guitar.",
    image: "pia3761.png",
    bodyImage: "pia3761_body.jpg",
    pickupImage: "pia3761_pickup.jpg",
    colorScheme: "gold",
  ),
  Guitar.signature(
    name: "JEM7VP", 
    neckMat: "Maple/Walnut",
    bodyMat: "Alder",
    fretboardMat: "Ebony", 
    fretAmount: 24,
    artist: "Steve Vai", 
    pickup: "DiMarzio Evolution", 
    price: 1199,
    description: "An Ebony fretboard features quick response and great articulation.",
    pickupDescription: "Steve Vai's Signature features DiMarzio® Evolution® humbuckers in the bridge and neck positions and a DiMarzio® Evolution® single coil in the middle position for a wide array of rock tones.",
    image: "jem7vp.png",
    bodyImage: "jem7vp_body.jpg",
    pickupImage: "jem7vp_pickup.jpg",
    colorScheme: "gold",
  ),
  Guitar.signature(
    name: "TOD10N",
    bodyMat: "Solid Sitka Spruce", 
    neckMat: "Nyatoh",
    fretboardMat: "Walnut",
    fretAmount: 22, 
    artist: "Tim Henson", 
    pickup: "Fishman S-core Pickup", 
    price: 599,
    description: "A Walnut fretboard features a well-balanced tonal character from low to high end.",
    pickupDescription: "Fishman® S-Core pickup accurately translates a full guitar sound to whatever amplification system you plug into. The AEQ210TF preamp provides the extra punch of on-board EQ, and the convenience of an easy-to-read digital tuner.",
    image: "tod10n.png",
    bodyImage: "tod10n_body.jpg",
    pickupImage: "tod10n_pickup.jpg",
    colorScheme: "purple",
  ),
  Guitar.signature(
    name: "TOD10", 
    bodyMat: "American Basswood",
    neckMat: "Roasted Maple",
    fretboardMat: "Ebony",
    fretAmount: 24, 
    artist: "Tim Henson", 
    pickup: "Fishman Fluence", 
    price: 599,
    description: "Ebony produces tight lows and mid range with a strong attack in the high end and features a quick response and rich sustain.",
    pickupDescription: "Tim's signature Fishman® Fluence™ pickups span the entire range of aggressive lead and rhythm tones to the cleanest of clean single coil combinations, even touching on sounds Tim was previously only able to produce with his acoustic guitars.",
    image: "tod10.png",
    bodyImage: "tod10_body.png",
    pickupImage: "tod10_pickup.png",
    colorScheme: "gold",
  ),
  Guitar.signature(
    name: "KIKOSP3", 
    bodyMat: "Flamed Maple",
    neckMat: "Maple",
    fretboardMat: "Rosewood",
    fretAmount: 24,
    artist: "Kiko Loureiro", 
    pickup: "Infinity R", 
    price: 699, 
    description: "The Flamed Maple Art Grain top displays a gorgeous wood grain. The Poplar body delivers a well-balanced tone with incredible thickness.", 
    pickupDescription: "Ibanez Infinity pickups deliver an accurate and tight sound with excellent dynamics. Even under heavy settings, they do not lose tonal clarity.", 
    image: "kikosp3.png", 
    bodyImage: "kikosp3_body.jpg", 
    pickupImage: "kikosp3_pickup.jpg", 
    colorScheme: "green"
  ),
   Guitar.signature(
    name: "KIKO10BP", 
    bodyMat: "Flamed Maple",
    neckMat: "Maple",
    fretboardMat: "Rosewood",
    fretAmount: 24,
    artist: "Kiko Loureiro", 
    pickup: "DiMarzio® KIKO original",
    price: 699, 
    description: "The Flamed Maple Art Grain top displays a gorgeous wood grain. The Poplar body delivers a well-balanced tone with incredible thickness.", 
    pickupDescription: "Kiko plays a wide range of music, from metal to jazz fusion, and the pickups were designed to reflect this range of sound. The neck and bridge pickups both humbuckers have medium output and a balanced sound in terms of frequency response.", 
    image: "kiko10bp.png", 
    bodyImage: "kiko10bp_body.jpg", 
    pickupImage: "kiko10bp_pickup.jpg", 
    colorScheme: "grey"
  ),
  Guitar.signature(
    name: "JS2450",
    neckMat: "Maple/Bubinga",
    bodyMat: "Alder",
    fretboardMat: "Rosewood",
    fretAmount: 24, 
    artist: "Joe Satriani", 
    pickup: "DiMarzio Mo Joe", 
    price: 799, 
    description: "The first 24-fret fingerboard JS model is Joe Satriani's newest adventure in guitars and includes his favorite DiMarzio® pickups.", 
    pickupDescription: "A high pass filter on volume pots maintains highs at low volumes and a push/pull coil tap adds sound and tonal variations for both pickups.", 
    image: "js2450.png", 
    bodyImage: "js2450_body.jpg", 
    pickupImage: "js2450_pickup.jpg", 
    colorScheme: "purple"
  ),
  Guitar.signature(
    name: "JS3CR", 
    neckMat: "Maple",
    bodyMat: "Basswood",
    fretboardMat: "Rosewood", 
    fretAmount: 22,
    artist: "Joe Satriani", 
    pickup: "DiMarzio PAF Pro", 
    price: 799, 
    description: "The first 24-fret fingerboard JS model is Joe Satriani's newest adventure in guitars and includes his favorite DiMarzio® pickups.", 
    pickupDescription: "The DiMarzio® PAF Pro® pickups produce an open and clean low end with a carefully tweaked treble side that helps cut through the mix. DiMarzio® Satchur8™ pickup fully supports Joe's versatile playing style and massive sound.", 
    image: "js3cr.png", 
    bodyImage: "js3cr_body.jpg", 
    pickupImage: "js3cr_pickup.jpg", 
    colorScheme: "grey"
  )
];

List<Artist> artistList = [
  Artist(
    name: "Steve Vai",
    description:"Some guitars are built for performance, some for aesthetic. These instruments are the best of both worlds. and perhaps the universe",
    image: "stevevai.png",
    group: "Solo Artist",
    guitarIndex: [0, 1]
  ),
  Artist(
    name: "Tim Henson",
    description:"We have shifted from guitar players to composers, focusing on crafting music over showcasing technical guitar skills, while still drawing on our lifelong expertise in playing the instrument.",
    image: "timhenson.png",
    group: "Polyphia",
    guitarIndex: [2, 3]
  ),
  Artist(
    name: "Kiko Loureiro",
    description:"My varied musical influences shape my style, needing versatile Ibanez guitars. I collaborated extensively for the best neck and body shapes to enhance my performance.",
    image: "kikoloureiro.png",
    group: "Megadeth",
    guitarIndex: [4, 5]
  ),
  Artist(
    name: "Joe Satriani",
    description:"With 24 frets, a deeper cutaway, and my Mo' Joe and Satch Track pickup combination, these guitars are liberating to play. I love the new JS models.",
    image: "joesatriani.png",
    group: "Solo Artist",
    guitarIndex: [6, 7]
  ),
];

List<News> newsList = [
  News.page(
    title: "Joe Satriani Signature", 
    subtitle: "NEW ALBUM AND SIGNATURE MODELS", 
    buttonText: "SHOP NOW", 
    nextPage: (() {
      const ProductPage();
    }), 
    image: "news1.jpg"
  ),
  News.page(
    title: "TOD10N", 
    subtitle: "TIM HENSON NYLON SIGNATURE", 
    buttonText: "SHOP NOW", 
    nextPage: const ProductPage(), 
    image: "news2.jpg"
  ),
  News.page(
    title: "PIA SERIES", 
    subtitle: "ALL NEW STEVE VAI SIGNATURE", 
    buttonText: "SHOP NOW", 
    nextPage: const ProductPage(), 
    image: "news3.jpg"
  )
];