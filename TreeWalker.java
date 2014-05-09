import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.FileInputStream;
import java.io.InputStream;
public class TreeWalker {
	public static int Tab = 0;
	public static RubyParser parser = null;
	public static void main(String[] args) throws Exception {
		String inputFile = null;
		if ( args.length>0 ) inputFile = args[0];
		InputStream is = System.in;
		if ( inputFile!=null ) is = new FileInputStream(inputFile);
		ANTLRInputStream input = new ANTLRInputStream(is);
		RubyLexer lexer = new RubyLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		parser = new RubyParser(tokens);
		ParseTree tree = parser.prog(); // parse; start at prog
		tree_walk(tree);
	}
	public static ParseTree tree_walk(ParseTree tree) {
		int i = 0;
		while(tree.getChild(i) != null) {
			ParseTree node = tree.getChild(i);
			Tab++;
			tree_walk(node);
			Tab--;
			i++;
		}
		String tab_str = "	";
		if(tree.getChildCount() != 1) {
			System.out.println(str_repeat(tab_str, Tab) + tree.getText());
		}
		return tree;
	}
	public static String str_repeat(String str, int i) {
		String str_res = "";
		while(i>0) {
			str_res = str_res + str;
			i--;
		}
		return str_res;
	}
}
