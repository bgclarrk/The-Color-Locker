# The Color Locker

## Setup ENV variables

Create a .env file in the root directory and add your GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET values.

    GOOGLE_CLIENT_ID=<your id here>
    GOOGLE_CLIENT_SECRET=<your secret here>

## Objective

Give users a single place to store color branding information.

## Description

This is an application where a user can create multiple projects and color palettes. These can be associated to keep track of different color palettes for different projects. It can be for any design purposes such as building websites, graphic design branding, home renovations, etc..

## License

Copyright (c) [2021] [The Color Locker]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


User ------< Project >------- Palette ------< Color

User
has_many projects
has_many palettes through projects

Project
user_id
palette_id
belongs_to user
belongs_to palette

Palette
has_many projects
has_many users through projects
has_many colors

Color
palette_id
belongs_to palette

Error creating new palette