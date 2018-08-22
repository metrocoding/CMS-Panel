<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="admin_product_add_product" %>

<!DOCTYPE html>

<html>
<head>

    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />

</head>
<body>

    <form runat="server">

        <div id="header"></div>

        <div id="content">

            <div class="holder">

                <div class="right">
                </div>

                <div class="center">
                    <div class="form">
                        <h2>افزودن آلبوم</h2>

                        <div id="error" runat="server"> ثبت آلبوم </div>

                        <div class="items item9">
                            <span class="title">نام آلبوم</span>
                            <input type="text" id="album_title" runat="server" placeholder="به فارسی یا لاتین ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item10">
                            <span class="title">هنرمند</span>
                            <input type="text" id="album_artist" runat="server" placeholder="نام هنرمند یا گروه ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item11">
                            <span class="title">دسته بندی</span>
                            <select id="album_genre" runat="server">
                                <option>راک</option>
                                <option>پاپ</option>
                                <option>هیپ هاپ</option>
                                <option>الکترونیک</option>
                                <option>جاز</option>
                                <option>سنتی</option>
                            </select>
                        </div>


                        <div class="items item12">
                            <span class="title">قیمت آلبوم</span>
                            <input type="text" id="album_price" runat="server" placeholder="به ریال ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>


                        <div class="items item13">
                            <span class="title">کاور آلبوم </span>
                            <input type="file" id="album_art" runat="server" />
                            <label for="album_art">آپلود </label>
                        </div>


                        <div class="items no_color">
                            <span class="title tt">وضعیت نمایش </span>

                            <input type="radio" id="show" runat="server" name="r" checked />
                            <label for="show">نمایش</label>

                            <input type="radio" id="hide" runat="server" name="r" />
                            <label for="hide">عدم نمایش</label>
                        </div>


                        <div class="items item7">
                            <span class="title tt2">توضیحات </span>
                            <textarea id="album_des" runat="server">  </textarea>
                        </div>

                        <div class="items item8">
                            <input type="submit" value="افزودن" runat="server" />
                            <input type="submit" value="پاک کردن" runat="server"  />
                        </div>


                    </div>


                </div>
            </div>

        </div>

        <div id="footer"></div>


    </form>

</body>
</html>

