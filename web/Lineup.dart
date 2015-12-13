import "SummonerWithChampion.dart";

class Lineup {

  SummonerWithChampion top;
  SummonerWithChampion mid;
  SummonerWithChampion jungle;
  SummonerWithChampion adc;
  SummonerWithChampion support;

  Lineup(SummonerWithChampion top, SummonerWithChampion mid, SummonerWithChampion jungle, SummonerWithChampion adc, SummonerWithChampion support ) {
    this.top = top;
    this.mid = mid;
    this.jungle = jungle;
    this.adc = adc;
    this.support = support;
  }

  double getScore() {
    return top.stats.topScore + mid.stats.midScore + jungle.stats.jungleScore + adc.stats.adcScore + support.stats.supportScore;
  }

  bool hasTank() {
    if (top.stats.champion.tags.contains("Tank") || mid.stats.champion.tags.contains("Tank") ||
    jungle.stats.champion.tags.contains("Tank") || adc.stats.champion.tags.contains("Tank") || support.stats.champion.tags.contains("Tank")) {
      return true;
    }
    return false;
  }

  bool hasMage() {
    if (top.stats.champion.tags.contains("Mage") || mid.stats.champion.tags.contains("Mage") ||
    jungle.stats.champion.tags.contains("Mage") || adc.stats.champion.tags.contains("Mage") || support.stats.champion.tags.contains("Mage")) {
      return true;
    }
    return false;
  }
}