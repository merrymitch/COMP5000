/**
 * java - Wyatt LeMaster
 *
 *
 * Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
 * Hobby Helper semester project
 * represents an activity object
 * 5/4/2023
 *
 */

package models;

public class ActivityModel {

    int activityID;
    String name;
    int category;

    public ActivityModel(int activityID, String name, int category) {
        this.activityID = activityID;
        this.name = name;
        this.category = category;
    }
    public int getActivityID() {
        return activityID;
    }

    public void setActivityID(int activityID) {
        this.activityID = activityID;
    }
    public void setName(String name) {
        this.name = name;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public int getCategory() {
        return category;
    }







}
