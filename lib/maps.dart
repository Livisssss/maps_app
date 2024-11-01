import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = {};
  Set<Polygon> _poligonos = {};
  final CameraPosition _cameraPosition = const CameraPosition(
      target: LatLng(-27.6145715, -52.228627), zoom: 17, bearing: 0);

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
    _carregarPoligonos();
  }

  void _carregarMarcadores() {
    Set<Marker> _marcadoresLocal = {};

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("predio8"),
      position: const LatLng(-27.613208719365684, -52.22958868208149),
      infoWindow: const InfoWindow(
          title: "Prédio 8",
          snippet: "CC / Arq.Urb. / Eng.Elétrica / Eng.Prod."),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("predio1"),
      position: const LatLng(-27.61297223778936, -52.22962891521746),
      infoWindow: const InfoWindow(
          title: "Prédio 1", snippet: "Eng.Civil / Eng.Mecânica / Agronomia"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("predio2"),
      position: const LatLng(-27.612705364469033, -52.22963546994817),
      infoWindow: const InfoWindow(
          title: "Prédio 2", snippet: "Medicina Veterinária / Agronomia"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("lago"),
      position: const LatLng(-27.614654304326468, -52.228159602057936),
      infoWindow: const InfoWindow(
        title: "Lago",
        snippet: "Lago Professor Tancredo Westphal Junior",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("auditorio"),
      position: const LatLng(-27.612743448778765, -52.22887843400558),
      infoWindow: const InfoWindow(
          title: "Auditório", snippet: "Auditório do Campus II da Uri"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("centroclinico"),
      position: const LatLng(-27.614426144224648, -52.226571734465736),
      infoWindow: const InfoWindow(
          title: "Centro Clínico", snippet: "Tem vários animais"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("laboratorio"),
      position: const LatLng(-27.61309044741297, -52.22854047570091),
      infoWindow: const InfoWindow(title: "Laboratório"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("salaeng"),
      position: const LatLng(-27.61286703745944, -52.22837417875734),
      infoWindow: const InfoWindow(title: "Sala de Engenharia"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ));

    _marcadoresLocal.add(Marker(
      markerId: const MarkerId("neuro"),
      position: const LatLng(-27.614087076775373, -52.225503724842646),
      infoWindow: const InfoWindow(
          title: "Bar do Neuro",
          snippet: "Point dos guri pós (ou durante) a aula ;)"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));

    setState(() {
      _marcadores = _marcadoresLocal;
    });
  }

  void _carregarPoligonos() {
    Set<Polygon> _poligonosLocal = {};

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_predio8"),
      points: const [
        LatLng(-27.613108674615443, -52.22934964286386),
        LatLng(-27.61311467028781, -52.229850354925546),
        LatLng(-27.613211600278998, -52.22984922719568),
        LatLng(-27.61321559739019, -52.229878548172266),
        LatLng(-27.613288544643908, -52.229876292712525),
        LatLng(-27.613290543198126, -52.22983456670738),
        LatLng(-27.613357494743184, -52.22984358854634),
        LatLng(-27.613354496913676, -52.2295424846714),
        LatLng(-27.613295539583497, -52.22954135694154),
        LatLng(-27.613291542475213, -52.22949963093639),
        LatLng(-27.613277552595086, -52.229345131944385),
        LatLng(-27.613107675336686, -52.22934738740412),
      ],
      strokeColor: Colors.blue.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.blue.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_predio1"),
      points: const [
        LatLng(-27.612882837383687, -52.2293733251911),
        LatLng(-27.612887833787656, -52.229895464120304),
        LatLng(-27.612942794216277, -52.22989771958003),
        LatLng(-27.612951787738336, -52.22990899687873),
        LatLng(-27.61301174453318, -52.22990899687873),
        LatLng(-27.61302073804958, -52.229893208660556),
        LatLng(-27.613077696969622, -52.22988982547095),
        LatLng(-27.61306570562049, -52.22936430335215),
      ],
      strokeColor: Colors.green.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.green.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_predio2"),
      points: const [
        LatLng(-27.61260004054476, -52.229380091573326),
        LatLng(-27.61261103266158, -52.229907869151866),
        LatLng(-27.612670989642957, -52.229906741422),
        LatLng(-27.61268298103528, -52.22992252964016),
        LatLng(-27.612742937977266, -52.22992027418042),
        LatLng(-27.61275193151574, -52.2299033582324),
        LatLng(-27.61280889057555, -52.22990110277266),
        LatLng(-27.61279889776018, -52.22937670838372),
      ],
      strokeColor: Colors.red.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.red.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_auditorio"),
      points: const [
        LatLng(-27.612743937258287, -52.228763223264444),
        LatLng(-27.612652003268014, -52.22886133576303),
        LatLng(-27.612763922898154, -52.22898313058884),
        LatLng(-27.612826877639844, -52.22892110544606),
        LatLng(-27.6128438654211, -52.22893576593435),
        LatLng(-27.612866848885638, -52.22891321133698),
        LatLng(-27.61285785535661, -52.22889967857856),
        LatLng(-27.612859853918685, -52.22888276263053),
      ],
      strokeColor: Colors.yellow.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.yellow.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_laboratorio"),
      points: const [
        LatLng(-27.613162635653087, -52.22836287914899),
        LatLng(-27.613135655136638, -52.22838317828663),
        LatLng(-27.613114670285906, -52.22836287914899),
        LatLng(-27.61281988267223, -52.22868766535117),
        LatLng(-27.612823879797727, -52.22870007037972),
        LatLng(-27.612805892731863, -52.22871473086802),
        LatLng(-27.61291781220477, -52.22884667526265),
        LatLng(-27.613270557652445, -52.228449714348876),
        LatLng(-27.613201607499732, -52.2283831782634),
        LatLng(-27.613183620495906, -52.22838881691275),
      ],
      strokeColor: Colors.cyan.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.cyan.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_salaeng"),
      points: const [
        LatLng(-27.61292880428918, -52.228147482732005),
        LatLng(-27.61288083881961, -52.2282016137657),
        LatLng(-27.612898825873156, -52.2282230406332),
        LatLng(-27.61264900542057, -52.22848692942247),
        LatLng(-27.612752930798056, -52.2286121074379),
        LatLng(-27.613056712105365, -52.22829183215519),
      ],
      strokeColor: Colors.pink.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.pink.withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_lago"),
      points: const [
        LatLng(-27.61522303982999, -52.2272972001618),
        LatLng(-27.61468889514811, -52.22736150051897),
        LatLng(-27.613848502242025, -52.227261031210915),
        LatLng(-27.613795087220726, -52.227357481746644),
        LatLng(-27.613556499807594, -52.22879620223803),
        LatLng(-27.613595670911078, -52.228928821724665),
        LatLng(-27.613745233177365, -52.22902929103273),
        LatLng(-27.61447167556574, -52.22900919717111),
        LatLng(-27.615201674092734, -52.22884040873357),
        LatLng(-27.615265771291995, -52.22885648382286),
        LatLng(-27.615504354981855, -52.229005178398786),
        LatLng(-27.615953033349083, -52.22853096326476),
      ],
      strokeColor: Color.fromARGB(255, 121, 3, 52).withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Color.fromARGB(255, 121, 3, 52).withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_centroclinico"),
      points: const [
        LatLng(-27.614625601073584, -52.22625083078435),
        LatLng(-27.614090006818643, -52.226534714240096),
        LatLng(-27.613876616293542, -52.22674842425734),
        LatLng(-27.613804296830526, -52.22717315874703),
        LatLng(-27.614338726378758, -52.22722050011606),
        LatLng(-27.614361337219627, -52.22698765188831),
        LatLng(-27.614554942353436, -52.22699243644094),
        LatLng(-27.614566247752133, -52.226858468967436),
        LatLng(-27.614944977934176, -52.226765967616686),
      ],
      strokeColor: Color.fromARGB(255, 208, 25, 245).withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Color.fromARGB(255, 208, 25, 245).withOpacity(0.3),
    ));

    _poligonosLocal.add(Polygon(
      polygonId: const PolygonId("poligono_neuro"),
      points: const [
        LatLng(-27.614095443842153, -52.22543954157876),
        LatLng(-27.613883598449426, -52.22559178511103),
        LatLng(-27.61394455400536, -52.22570004717843),
        LatLng(-27.614154400741786, -52.22553201542799),
      ],
      strokeColor: Colors.orange.withOpacity(0.8),
      strokeWidth: 2,
      fillColor: Colors.orange.withOpacity(0.3),
    ));

    setState(() {
      _poligonos = _poligonosLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Uri - Campus II",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 98, 163),
        elevation: 0,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _marcadores,
        polygons: _poligonos,
        myLocationEnabled: true,
      ),
    );
  }
}
