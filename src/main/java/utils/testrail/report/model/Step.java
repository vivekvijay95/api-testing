package utils.testrail.report.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * @author Thanh Le
 * Created: 04 Dec 2019
 */
public class Step {
    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("result")
    @Expose
    private Result result;
    @SerializedName("match")
    @Expose
    private Match match;
    @SerializedName("keyword")
    @Expose
    private String keyword;
    @SerializedName("line")
    @Expose
    private Integer line;
    @SerializedName("doc_string")
    @Expose
    private DocString docString;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }

    public Match getMatch() {
        return match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getLine() {
        return line;
    }

    public void setLine(Integer line) {
        this.line = line;
    }

    public DocString getDocString() {
        return docString;
    }

    public void setDocString(DocString docString) {
        this.docString = docString;
    }
}
