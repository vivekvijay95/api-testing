import com.intuit.karate.KarateOptions;
import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.Test;
import utils.testrail.exceptions.NoTestRailUrlException;
import utils.testrail.exceptions.ProjectNotFoundException;
import utils.testrail.handlers.TestRailIntegrationImp;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author Kamal Shingala
 */
@KarateOptions(tags = {"~@ignore"})
public class TestRunner {
    // this class will automatically pick up all *.feature files
    @Test
    public void testParallel() {
        //System.setProperty("karate.env", "dev");
        String karateOutputPath = "target/surefire-reports";
        KarateStats stats = CucumberRunner.parallel(getClass(), 10, karateOutputPath);

        // Create Cucumber Reports
        generateReport(karateOutputPath);
        assertTrue("there are scenario failures", stats.getFailCount() == 0);
    }

    //// GENERATE REPORT
    private static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "flexi-originations Scenarios");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    @After
    public void updateTestRail() throws ProjectNotFoundException, NoTestRailUrlException, IOException {
        TestRailIntegrationImp imp = new TestRailIntegrationImp();
        imp.execute();
    }
}
