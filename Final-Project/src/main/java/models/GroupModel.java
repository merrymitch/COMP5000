/**
 * java - Wyatt LeMaster
 *
 * Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
 * Hobby Helper semester project
 * 5/4/2023
 *
 * represents a group
 *
 */

package models;

public class GroupModel {
  public GroupModel(String name, int group_id) {

    this.group_id = group_id;
    this.name = name;
  }
  private String name;
  private int group_id;
  public int getGroup_id() {
    return group_id;
  }

  public void setGroup_id(int group_id) {
    this.group_id = group_id;
  }



  public void setName(String name) { this.name = name; }

  public String getName() { return this.name; }

}
