<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2023/12/14
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/markdown-it/13.0.1/markdown-it.min.js" integrity="sha512-SYfDUYPg5xspsG6OOpXU366G8SZsdHOhqk/icdrYJ2E/WKZxPxze7d2HD3AyXpT7U22PZ5y74xRpqZ6A2bJ+kQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <script>
        window.onload = function() {
            var md = window.markdownit();
            var div = document.getElementsByClassName('markdown');
            for(var i = 0; i < div.length; i++) {
                var content = div[i].innerHTML;
                document.getElementsByClassName('markdown')[i].innerHTML = md.render(content);
                console.log(content)

                console.log(md.render(content))
            }
        }
    </script>

</head>
<body>


<div class="markdown">
# h1 Heading
## h2 Heading
### h3 Heading #### h4 Heading
##### h5 Heading
###### h6 Heading

+ one
    + two
+ two and half
    + three
+ three and half
    + three point seventy five
</div>

</body>
</html>