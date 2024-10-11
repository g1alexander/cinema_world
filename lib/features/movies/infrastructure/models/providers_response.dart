class ProvidersResponse {
  final int id;
  final Results results;

  ProvidersResponse({
    required this.id,
    required this.results,
  });

  factory ProvidersResponse.fromJson(Map<String, dynamic> json) =>
      ProvidersResponse(
        id: json["id"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  final Ae ad;
  final Ae ae;
  final Ae ag;
  final Ae al;
  final Ae ao;
  final Ae ar;
  final Ae at;
  final Ae au;
  final Ae az;
  final Ae ba;
  final Ae bb;
  final Ae be;
  final Ae bf;
  final Ae bg;
  final Ae bh;
  final Ae bo;
  final Ae br;
  final Ae by;
  final Ae bz;
  final Ae ca;
  final Ae ch;
  final Ae ci;
  final Ae cl;
  final Ae cm;
  final Ae co;
  final Ae cr;
  final Ae cv;
  final Ae cy;
  final Ae cz;
  final Ae de;
  final Ae dk;
  final Ae resultsDo;
  final Ae dz;
  final Ae ec;
  final Ae ee;
  final Ae eg;
  final Ae es;
  final Ae fi;
  final Ae fj;
  final Ae fr;
  final Ae gb;
  final Ae gf;
  final Ae gg;
  final Ae gh;
  final Ae gi;
  final Ae gq;
  final Ae gr;
  final Ae gt;
  final Ae hk;
  final Ae hn;
  final Ae hr;
  final Ae hu;
  final Ae id;
  final Ae ie;
  final Ae il;
  final Ae resultsIn;
  final Ae iq;
  final Ae resultsIs;
  final Ae it;
  final Ae jm;
  final Ae jo;
  final Ae jp;
  final Ae ke;
  final Ae kr;
  final Ae kw;
  final Ae lb;
  final Ae lc;
  final Ae li;
  final Ae lt;
  final Ae lu;
  final Ae lv;
  final Ae ly;
  final Ae ma;
  final Ae mc;
  final Ae md;
  final Ae me;
  final Ae mg;
  final Ae mk;
  final Ae ml;
  final Ae mt;
  final Ae mu;
  final Ae mx;
  final Ae my;
  final Ae mz;
  final Ae ne;
  final Ae ng;
  final Ae ni;
  final Ae nl;
  final Ae no;
  final Ae nz;
  final Ae om;
  final Ae pa;
  final Ae pe;
  final Ae pf;
  final Ae pg;
  final Ae ph;
  final Ae pk;
  final Ae pl;
  final Ae ps;
  final Ae pt;
  final Ae py;
  final Ae qa;
  final Ae ro;
  final Ae rs;
  final Ae ru;
  final Ae sa;
  final Ae sc;
  final Ae se;
  final Ae sg;
  final Ae si;
  final Ae sk;
  final Ae sm;
  final Ae sn;
  final Ae sv;
  final Ae tc;
  final Ae th;
  final Ae tn;
  final Ae tr;
  final Ae tt;
  final Ae tw;
  final Ae tz;
  final Ae ua;
  final Ae ug;
  final Ae us;
  final Ae uy;
  final Ae ve;
  final Ae ye;
  final Ae za;
  final Ae zm;
  final Ae zw;
  final Ae bt;
  final Ae cf;
  final Ae cd;
  final Ae sz;
  final Ae ir;
  final Ae kz;
  final Ae kp;
  final Ae kg;
  final Ae la;
  final Ae lr;
  final Ae mh;
  final Ae mr;
  final Ae fm;
  final Ae np;
  final Ae nu;
  final Ae pw;
  final Ae kn;
  final Ae vc;
  final Ae sl;
  final Ae sb;
  final Ae so;
  final Ae ss;
  final Ae sd;
  final Ae sr;
  final Ae tl;
  final Ae tk;
  final Ae tv;
  final Ae uz;
  final Ae vu;
  final Ae eh;

  Results({
    required this.ad,
    required this.ae,
    required this.ag,
    required this.al,
    required this.ao,
    required this.ar,
    required this.at,
    required this.au,
    required this.az,
    required this.ba,
    required this.bb,
    required this.be,
    required this.bf,
    required this.bg,
    required this.bh,
    required this.bo,
    required this.br,
    required this.by,
    required this.bz,
    required this.ca,
    required this.ch,
    required this.ci,
    required this.cl,
    required this.cm,
    required this.co,
    required this.cr,
    required this.cv,
    required this.cy,
    required this.cz,
    required this.de,
    required this.dk,
    required this.resultsDo,
    required this.dz,
    required this.ec,
    required this.ee,
    required this.eg,
    required this.es,
    required this.fi,
    required this.fj,
    required this.fr,
    required this.gb,
    required this.gf,
    required this.gg,
    required this.gh,
    required this.gi,
    required this.gq,
    required this.gr,
    required this.gt,
    required this.hk,
    required this.hn,
    required this.hr,
    required this.hu,
    required this.id,
    required this.ie,
    required this.il,
    required this.resultsIn,
    required this.iq,
    required this.resultsIs,
    required this.it,
    required this.jm,
    required this.jo,
    required this.jp,
    required this.ke,
    required this.kr,
    required this.kw,
    required this.lb,
    required this.lc,
    required this.li,
    required this.lt,
    required this.lu,
    required this.lv,
    required this.ly,
    required this.ma,
    required this.mc,
    required this.md,
    required this.me,
    required this.mg,
    required this.mk,
    required this.ml,
    required this.mt,
    required this.mu,
    required this.mx,
    required this.my,
    required this.mz,
    required this.ne,
    required this.ng,
    required this.ni,
    required this.nl,
    required this.no,
    required this.nz,
    required this.om,
    required this.pa,
    required this.pe,
    required this.pf,
    required this.pg,
    required this.ph,
    required this.pk,
    required this.pl,
    required this.ps,
    required this.pt,
    required this.py,
    required this.qa,
    required this.ro,
    required this.rs,
    required this.ru,
    required this.sa,
    required this.sc,
    required this.se,
    required this.sg,
    required this.si,
    required this.sk,
    required this.sm,
    required this.sn,
    required this.sv,
    required this.tc,
    required this.th,
    required this.tn,
    required this.tr,
    required this.tt,
    required this.tw,
    required this.tz,
    required this.ua,
    required this.ug,
    required this.us,
    required this.uy,
    required this.ve,
    required this.ye,
    required this.za,
    required this.zm,
    required this.zw,
    required this.bt,
    required this.cf,
    required this.cd,
    required this.sz,
    required this.ir,
    required this.kz,
    required this.kp,
    required this.kg,
    required this.la,
    required this.lr,
    required this.mh,
    required this.mr,
    required this.fm,
    required this.np,
    required this.nu,
    required this.pw,
    required this.kn,
    required this.vc,
    required this.sl,
    required this.sb,
    required this.so,
    required this.ss,
    required this.sd,
    required this.sr,
    required this.tl,
    required this.tk,
    required this.tv,
    required this.uz,
    required this.vu,
    required this.eh,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        ad: Ae.fromJson(json["AD"] ?? {}),
        ae: Ae.fromJson(json["AE"] ?? {}),
        ag: Ae.fromJson(json["AG"] ?? {}),
        al: Ae.fromJson(json["AL"] ?? {}),
        ao: Ae.fromJson(json["AO"] ?? {}),
        ar: Ae.fromJson(json["AR"] ?? {}),
        at: Ae.fromJson(json["AT"] ?? {}),
        au: Ae.fromJson(json["AU"] ?? {}),
        az: Ae.fromJson(json["AZ"] ?? {}),
        ba: Ae.fromJson(json["BA"] ?? {}),
        bb: Ae.fromJson(json["BB"] ?? {}),
        be: Ae.fromJson(json["BE"] ?? {}),
        bf: Ae.fromJson(json["BF"] ?? {}),
        bg: Ae.fromJson(json["BG"] ?? {}),
        bh: Ae.fromJson(json["BH"] ?? {}),
        bo: Ae.fromJson(json["BO"] ?? {}),
        br: Ae.fromJson(json["BR"] ?? {}),
        by: Ae.fromJson(json["BY"] ?? {}),
        bz: Ae.fromJson(json["BZ"] ?? {}),
        ca: Ae.fromJson(json["CA"] ?? {}),
        ch: Ae.fromJson(json["CH"] ?? {}),
        ci: Ae.fromJson(json["CI"] ?? {}),
        cl: Ae.fromJson(json["CL"] ?? {}),
        cm: Ae.fromJson(json["CM"] ?? {}),
        co: Ae.fromJson(json["CO"] ?? {}),
        cr: Ae.fromJson(json["CR"] ?? {}),
        cv: Ae.fromJson(json["CV"] ?? {}),
        cy: Ae.fromJson(json["CY"] ?? {}),
        cz: Ae.fromJson(json["CZ"] ?? {}),
        de: Ae.fromJson(json["DE"] ?? {}),
        dk: Ae.fromJson(json["DK"] ?? {}),
        resultsDo: Ae.fromJson(json["DO"] ?? {}),
        dz: Ae.fromJson(json["DZ"] ?? {}),
        ec: Ae.fromJson(json["EC"] ?? {}),
        ee: Ae.fromJson(json["EE"] ?? {}),
        eg: Ae.fromJson(json["EG"] ?? {}),
        es: Ae.fromJson(json["ES"] ?? {}),
        fi: Ae.fromJson(json["FI"] ?? {}),
        fj: Ae.fromJson(json["FJ"] ?? {}),
        fr: Ae.fromJson(json["FR"] ?? {}),
        gb: Ae.fromJson(json["GB"] ?? {}),
        gf: Ae.fromJson(json["GF"] ?? {}),
        gg: Ae.fromJson(json["GG"] ?? {}),
        gh: Ae.fromJson(json["GH"] ?? {}),
        gi: Ae.fromJson(json["GI"] ?? {}),
        gq: Ae.fromJson(json["GQ"] ?? {}),
        gr: Ae.fromJson(json["GR"] ?? {}),
        gt: Ae.fromJson(json["GT"] ?? {}),
        hk: Ae.fromJson(json["HK"] ?? {}),
        hn: Ae.fromJson(json["HN"] ?? {}),
        hr: Ae.fromJson(json["HR"] ?? {}),
        hu: Ae.fromJson(json["HU"] ?? {}),
        id: Ae.fromJson(json["ID"] ?? {}),
        ie: Ae.fromJson(json["IE"] ?? {}),
        il: Ae.fromJson(json["IL"] ?? {}),
        resultsIn: Ae.fromJson(json["IN"] ?? {}),
        iq: Ae.fromJson(json["IQ"] ?? {}),
        resultsIs: Ae.fromJson(json["IS"] ?? {}),
        it: Ae.fromJson(json["IT"] ?? {}),
        jm: Ae.fromJson(json["JM"] ?? {}),
        jo: Ae.fromJson(json["JO"] ?? {}),
        jp: Ae.fromJson(json["JP"] ?? {}),
        ke: Ae.fromJson(json["KE"] ?? {}),
        kr: Ae.fromJson(json["KR"] ?? {}),
        kw: Ae.fromJson(json["KW"] ?? {}),
        lb: Ae.fromJson(json["LB"] ?? {}),
        lc: Ae.fromJson(json["LC"] ?? {}),
        li: Ae.fromJson(json["LI"] ?? {}),
        lt: Ae.fromJson(json["LT"] ?? {}),
        lu: Ae.fromJson(json["LU"] ?? {}),
        lv: Ae.fromJson(json["LV"] ?? {}),
        ly: Ae.fromJson(json["LY"] ?? {}),
        ma: Ae.fromJson(json["MA"] ?? {}),
        mc: Ae.fromJson(json["MC"] ?? {}),
        md: Ae.fromJson(json["MD"] ?? {}),
        me: Ae.fromJson(json["ME"] ?? {}),
        mg: Ae.fromJson(json["MG"] ?? {}),
        mk: Ae.fromJson(json["MK"] ?? {}),
        ml: Ae.fromJson(json["ML"] ?? {}),
        mt: Ae.fromJson(json["MT"] ?? {}),
        mu: Ae.fromJson(json["MU"] ?? {}),
        mx: Ae.fromJson(json["MX"] ?? {}),
        my: Ae.fromJson(json["MY"] ?? {}),
        mz: Ae.fromJson(json["MZ"] ?? {}),
        ne: Ae.fromJson(json["NE"] ?? {}),
        ng: Ae.fromJson(json["NG"] ?? {}),
        ni: Ae.fromJson(json["NI"] ?? {}),
        nl: Ae.fromJson(json["NL"] ?? {}),
        no: Ae.fromJson(json["NO"] ?? {}),
        nz: Ae.fromJson(json["NZ"] ?? {}),
        om: Ae.fromJson(json["OM"] ?? {}),
        pa: Ae.fromJson(json["PA"] ?? {}),
        pe: Ae.fromJson(json["PE"] ?? {}),
        pf: Ae.fromJson(json["PF"] ?? {}),
        pg: Ae.fromJson(json["PG"] ?? {}),
        ph: Ae.fromJson(json["PH"] ?? {}),
        pk: Ae.fromJson(json["PK"] ?? {}),
        pl: Ae.fromJson(json["PL"] ?? {}),
        ps: Ae.fromJson(json["PS"] ?? {}),
        pt: Ae.fromJson(json["PT"] ?? {}),
        py: Ae.fromJson(json["PY"] ?? {}),
        qa: Ae.fromJson(json["QA"] ?? {}),
        ro: Ae.fromJson(json["RO"] ?? {}),
        rs: Ae.fromJson(json["RS"] ?? {}),
        ru: Ae.fromJson(json["RU"] ?? {}),
        sa: Ae.fromJson(json["SA"] ?? {}),
        sc: Ae.fromJson(json["SC"] ?? {}),
        se: Ae.fromJson(json["SE"] ?? {}),
        sg: Ae.fromJson(json["SG"] ?? {}),
        si: Ae.fromJson(json["SI"] ?? {}),
        sk: Ae.fromJson(json["SK"] ?? {}),
        sm: Ae.fromJson(json["SM"] ?? {}),
        sn: Ae.fromJson(json["SN"] ?? {}),
        sv: Ae.fromJson(json["SV"] ?? {}),
        tc: Ae.fromJson(json["TC"] ?? {}),
        th: Ae.fromJson(json["TH"] ?? {}),
        tn: Ae.fromJson(json["TN"] ?? {}),
        tr: Ae.fromJson(json["TR"] ?? {}),
        tt: Ae.fromJson(json["TT"] ?? {}),
        tw: Ae.fromJson(json["TW"] ?? {}),
        tz: Ae.fromJson(json["TZ"] ?? {}),
        ua: Ae.fromJson(json["UA"] ?? {}),
        ug: Ae.fromJson(json["UG"] ?? {}),
        us: Ae.fromJson(json["US"] ?? {}),
        uy: Ae.fromJson(json["UY"] ?? {}),
        ve: Ae.fromJson(json["VE"] ?? {}),
        ye: Ae.fromJson(json["YE"] ?? {}),
        za: Ae.fromJson(json["ZA"] ?? {}),
        zm: Ae.fromJson(json["ZM"] ?? {}),
        zw: Ae.fromJson(json["ZW"] ?? {}),
        bt: Ae.fromJson(json["BT"] ?? {}),
        cf: Ae.fromJson(json["CF"] ?? {}),
        cd: Ae.fromJson(json["CD"] ?? {}),
        sz: Ae.fromJson(json["SZ"] ?? {}),
        ir: Ae.fromJson(json["IR"] ?? {}),
        kz: Ae.fromJson(json["KZ"] ?? {}),
        kp: Ae.fromJson(json["KP"] ?? {}),
        kg: Ae.fromJson(json["KG"] ?? {}),
        la: Ae.fromJson(json["LA"] ?? {}),
        lr: Ae.fromJson(json["LR"] ?? {}),
        mh: Ae.fromJson(json["MH"] ?? {}),
        mr: Ae.fromJson(json["MR"] ?? {}),
        fm: Ae.fromJson(json["FM"] ?? {}),
        np: Ae.fromJson(json["NP"] ?? {}),
        nu: Ae.fromJson(json["NU"] ?? {}),
        pw: Ae.fromJson(json["PW"] ?? {}),
        kn: Ae.fromJson(json["KN"] ?? {}),
        vc: Ae.fromJson(json["VC"] ?? {}),
        sl: Ae.fromJson(json["SL"] ?? {}),
        sb: Ae.fromJson(json["SB"] ?? {}),
        so: Ae.fromJson(json["SO"] ?? {}),
        ss: Ae.fromJson(json["SS"] ?? {}),
        sd: Ae.fromJson(json["SD"] ?? {}),
        sr: Ae.fromJson(json["SR"] ?? {}),
        tl: Ae.fromJson(json["TL"] ?? {}),
        tk: Ae.fromJson(json["TK"] ?? {}),
        tv: Ae.fromJson(json["TV"] ?? {}),
        uz: Ae.fromJson(json["UZ"] ?? {}),
        vu: Ae.fromJson(json["VU"] ?? {}),
        eh: Ae.fromJson(json["EH"] ?? {}),
      );
}

class Flatrate {
  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  Flatrate({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory Flatrate.fromJson(Map<String, dynamic> json) => Flatrate(
        logoPath: json["logo_path"] ?? '',
        providerId: json["provider_id"] ?? 0,
        providerName: json["provider_name"] ?? '',
        displayPriority: json["display_priority"] ?? 0,
      );
}

class Ae {
  final String link;
  final List<Flatrate>? flatrate;
  final List<Flatrate> buy;
  final List<Flatrate> rent;
  final List<Flatrate>? ads;

  Ae({
    required this.link,
    this.flatrate,
    required this.buy,
    required this.rent,
    this.ads,
  });

  factory Ae.fromJson(Map<String, dynamic> json) => Ae(
        link: json["link"] ?? '',
        flatrate: json["flatrate"] == null
            ? []
            : List<Flatrate>.from(
                json["flatrate"]!.map((x) => Flatrate.fromJson(x))),
        buy: json["buy"] == null
            ? []
            : List<Flatrate>.from(json["buy"].map((x) => Flatrate.fromJson(x))),
        rent: json["rent"] == null
            ? []
            : List<Flatrate>.from(
                json["rent"].map((x) => Flatrate.fromJson(x))),
        ads: json["ads"] == null
            ? []
            : List<Flatrate>.from(
                json["ads"]!.map((x) => Flatrate.fromJson(x))),
      );
}
