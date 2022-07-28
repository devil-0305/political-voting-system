<?php
    require_once "include/config.php";
    $email = $password = $confirm_password = "";
    $email_err = $password_err = $confirm_password_err = "";
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        // Check if email is empty
        if (empty(trim($_POST["email"]))) {
            $email_err = "email cannot be blank";
        } else {
            $sql = "SELECT email FROM users WHERE email = ?";
            $stmt = mysqli_prepare($conn, $sql);
            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "s", $param_email);

                // Set the value of param email
                $param_email = trim($_POST['email']);

                // Try to execute this statement
                if (mysqli_stmt_execute($stmt)) {
                    mysqli_stmt_store_result($stmt);
                    if (mysqli_stmt_num_rows($stmt) == 1) {
                        $email_err = "This email is already taken";
                    } else {
                        $email = trim($_POST['email']);
                    }
                } else {
                    echo "Something went wrong";
                }
            }
        }
        mysqli_stmt_close($stmt);
        // Check for password
        if (empty(trim($_POST['password']))) {
            $password_err = "Password cannot be blank";
        } elseif (strlen(trim($_POST['password'])) < 5) {
            $password_err = "Password cannot be less than 5 characters";
        } else {
            $password = trim($_POST['password']);
        }
        // Check for confirm password field
        if (trim($_POST['password']) !=  trim($_POST['confirm_password'])) {
            $password_err = "Passwords should match";
        }
        // If there were no errors, go ahead and insert into the database
        if (empty($email_err) && empty($password_err) && empty($confirm_password_err)) {
            $sql = "INSERT INTO users (email, password,status) VALUES (?, ?,'Unvoted')";
            $stmt = mysqli_prepare($conn, $sql);
            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "ss", $param_email, $param_password);
                // Set these parameters
                $param_email = $email;
                $param_password = password_hash($password, PASSWORD_DEFAULT);
                // Try to execute the query
                if (mysqli_stmt_execute($stmt)) {
                    header("location: index.php");
                } else {
                    echo "Something went wrong... cannot redirect!";
                }
            }
            mysqli_stmt_close($stmt);
        }
        mysqli_close($conn);
    }
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="msapplication-TileColor" content="#0ed3cf">
    <meta name="theme-color" content="#0ed3cf">
    <title>Sign Up Form . </title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://unpkg.com/tailwindcss@0.3.0/dist/tailwind.min.css" rel="stylesheet">
    <!-- You need focus-trap.js to make the modal accessible -->
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="./assets/js/init-alpine.js"></script>
    <script src="./assets/js/focus-trap.js" defer></script>
</head>

<body class="bg-gray-200">
    <div class="bg-grey-lighter min-h-screen flex flex-col">
        <div class="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2">
            <div class="bg-white px-6 py-8 rounded shadow-md text-black w-full">
                <div class="w-full">
                    <h1 class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200">
                        Create account to vote
                    </h1>
                    <form action="" method="POST">
                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Email</span>
                            <input placeholder="example@email.com" type="email" name="email" required class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" />
                        </label>
                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Password</span>
                            <input placeholder="password" type="password" name="password" required class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" />
                        </label>
                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">
                                Confirm password
                            </span>
                            <input placeholder="confirm_password" type="password" name="confirm_password" required class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" />
                        </label>
                        <div class="flex mt-6 text-sm">
                            <label class="flex items-center dark:text-gray-400">
                                <input type="checkbox" class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" />
                                <span class="ml-2">
                                    I agree to the
                                    <span class="underline">privacy policy</span>
                                </span>
                            </label>
                        </div>
                        <!-- You should use a button here, as the anchor is only used for the example  -->
                        <button type="submit" value="Submit" name="submit" class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                            Create account
                        </button>
                    </form>
                    <p class="mt-4">
                        <a class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline" href="user.php">Already have an account? Login</a>
                    </p>
                    <p class="mt-4">
                     <a class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline" href="index.php">Go Back</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>