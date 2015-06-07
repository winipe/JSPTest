package kr.nipa.action;

public class ActionCommandFactory {
	private static ActionCommandFactory instance = null;
	
	private ActionCommandFactory() {
		
	}
	
	public static ActionCommandFactory getInstance() {
		if (instance == null)
			instance = new ActionCommandFactory();
		
		return instance;
	}
	
	public ActionCommand getAction(String cmd) {
		if (cmd.equals("get")) {
			return new GetActionCommand();
		} else if (cmd.equals("getlist")) {
			return new GetListActionCommand();
		} else if (cmd.equals("update")) {
			return new UpdateActionCommand();
		} else if (cmd.equals("delete")) {
			return new DeleteActionCommand();
		} else if (cmd.equals("insert")) {
			return new InsertActionCommand();
		} else if (cmd.equals("login")) {
			return new LoginActionCommand();
		} else if (cmd.equals("join")) {
			return new JoinActionCommand();
		} else if (cmd.equals("logout")) {
			return new LogoutActionCommand();
		}
		
		return null;
	}
}
