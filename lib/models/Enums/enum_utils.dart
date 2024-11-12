import './area_of_origin.dart';
import './card_status.dart';
import './due_status.dart';
import './red_flagIssue.dart';
import './type_of_van.dart';

class EnumUtils{

  static AreaOfOrigin areaOfOriginFromJson(String string){
    for (AreaOfOrigin element in AreaOfOrigin.values){
      if(element.name == string){
        return element;
      }
    }

    throw Exception("$string not found in AreaOfOrigins");
  }

  static RedFlagIssue redFlagIssueFromJson(String string){
    for (RedFlagIssue element in RedFlagIssue.values){
      if(element.name == string){
        return element;
      }
    }

    throw Exception("$string not found in RedFlagIssues");
  }

  static CardStatus cardStatusFromJson(String string){
    for (CardStatus element in CardStatus.values){
      if(element.name == string){
        return element;
      }
    }

    throw Exception("$string not found in CardStatuses");
  }

  static DueStatus dueStatusFromJson(String string){
    for (DueStatus element in DueStatus.values){
      if(element.name == string){
        return element;
      }
    }

    throw Exception("$string not found in DueStatuses");
  }

  static TypeOfVan typeOfVanFromJson(String string){
    for (TypeOfVan element in TypeOfVan.values){
      if(element.name == string){
        return element;
      }
    }

    throw Exception("$string not found in TypeOfVans");
  }
}