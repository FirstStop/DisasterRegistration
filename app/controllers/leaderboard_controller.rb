class LeaderboardController < ApplicationController
  def index
    unordered_stats = Hash[PublicActivity::Activity.find_all_by_key('person.vcard_accessed')
        .group_by {|a|a.trackable}
        .map{|(person,activities)| [person, activities.count]}]
    @stats = unordered_stats.sort_by {|k, v| -v}
  end
end
