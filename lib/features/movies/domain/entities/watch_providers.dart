class WatchProviders {
  final String isoCode;
  final String nameCountry;

  final List<Providers> streaming;
  final List<Providers> rent;
  final List<Providers> buy;
  final List<Providers> ads;

  WatchProviders({
    required this.isoCode,
    required this.nameCountry,
    required this.streaming,
    required this.rent,
    required this.buy,
    required this.ads,
  });
}

class Providers {
  final String providerName;
  final String logoPath;

  Providers({
    required this.providerName,
    required this.logoPath,
  });
}
