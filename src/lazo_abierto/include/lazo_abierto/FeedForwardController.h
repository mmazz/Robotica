#include "TrajectoryFollower.h"

class FeedForwardController : public TrajectoryFollower
{
  public:

    FeedForwardController(ros::NodeHandle& nh);

  protected:

    bool control(const ros::Time& t, double& v_x, double& v_y, double& w) override;
};
