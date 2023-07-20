import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
import scala.language.postfixOps

/**
 *
 * @author Kamal Shingala
 */
class RunGatlingScenarios extends Simulation {

  ///// Set Virtual Users and Duration of the Performance Test
  val vUsers = 5
  val duration = 10 second

  ///// APIs SCOPE
  val protocol = karateProtocol(
    "/functionality1" -> Nil,
    "/functionality2" -> Nil) // pauseFor("get" -> 15)


  ///// SCENARIOS FOR PERFORMANCE TESTING
  val addApplicant = scenario("basicAuth").exec(karateFeature("classpath:features/testAPI/functionality1.feature"))
  val addApplication = scenario("oAuthV1").exec(karateFeature("classpath:features/testAPI/functionality2.feature"))

  ///// SETUP WORKLOAD
  setUp(
    addApplicant.inject(rampUsers(vUsers) during duration),
    addApplication.inject(rampUsers(vUsers) during duration)
  ).protocols(protocol)

  ///// THROTTLE AND RELATED CONCEPTS OF GATLING ARE NOT SUPPORTED YET
  //setUp(userLogin.inject(rampUsers(5) during (1 minutes))).protocols(protocol).throttle(reachRps(10) in (10 seconds), holdFor(30 minutes))
}