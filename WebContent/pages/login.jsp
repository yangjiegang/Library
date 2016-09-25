<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<div id="login" align="center">
		<fieldset>
			<legend>Login</legend>
			<form action="/Library/login.do" method="POST">
				<p>
					<label for="">username</label>
					<input type="text" name="userName" required="required"
						autocomplete="autocomplete" />
				</p>
				<p>
					<label for="">password</label>
					<input type="password" name="password" required="required" />
				</p>
				<p>
					<input type="submit" value="submit" />
					<input type="reset" value="reset" />
				</p>
			</form>
		</fieldset>
	</div>
</body>
</html>