package com.iqonic.datingapp.utils

import com.iqonic.datingapp.R
import com.iqonic.datingapp.models.*


fun generateUser(): ArrayList<User> {
    val searches = ArrayList<User>()
    searches.apply {
        addUser {
            name = "Dezaa"; img = R.drawable.da_img10; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }

        addUser {
            name = "Rose"; img = R.drawable.da_img7; distance =
            "2 km"; proffesion = "Art Director";age = "22"
        }
        addUser {
            name = "Spohia"; img = R.drawable.da_img8; distance = "2 km"; proffesion =
            "Art Director";age = "20"
        }
        addUser {
            name = "Stella"; img = R.drawable.da_img9; distance = "2 km"; proffesion =
            "Art Director";age = "18"
        }
        addUser {
            name = "Sam"; img = R.drawable.da_user_profile; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }
        addUser {
            name = "Tiffany"; img = R.drawable.da_img11; distance = "2 km"; proffesion =
            "Art Director";age = "21"
        }
        addUser {
            name = "Dezaa"; img = R.drawable.da_img12; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }

        addUser {
            name = "Rose"; img = R.drawable.da_img14; distance =
            "2 km"; proffesion = "Art Director";age = "22"
        }
        addUser {
            name = "Spohia"; img = R.drawable.da_img15; distance = "2 km"; proffesion =
            "Art Director";age = "20"
        }
        addUser {
            name = "Stella"; img = R.drawable.da_img16; distance = "2 km"; proffesion =
            "Art Director";age = "18"
        }
        addUser {
            name = "Sam"; img = R.drawable.da_img17; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }

    }
    return searches
}

fun generateList(): ArrayList<User> {
    val searches = ArrayList<User>()
    searches.apply {
        addUser {
            name = "Dezaa"; img = R.drawable.da_user_profile; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }

        addUser {
            name = "Rose"; img = R.drawable.da_img7; distance =
            "2 km"; proffesion = "Art Director";age = "22"
        }
        addUser {
            name = "Spohia"; img = R.drawable.da_img8; distance = "2 km"; proffesion =
            "Art Director";age = "20"
        }
        addUser {
            name = "Stella"; img = R.drawable.da_img9; distance = "2 km"; proffesion =
            "Art Director";age = "18"
        }
        addUser {
            name = "Sam"; img = R.drawable.da_img10; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }
        addUser {
            name = "Tiffany"; img = R.drawable.da_img11; distance = "2 km"; proffesion =
            "Art Director";age = "21"
        }
        addUser {
            name = "Dezaa"; img = R.drawable.da_img12; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }

        addUser {
            name = "Rose"; img = R.drawable.da_img14; distance =
            "2 km"; proffesion = "Art Director";age = "22"
        }
        addUser {
            name = "Spohia"; img = R.drawable.da_img15; distance = "2 km"; proffesion =
            "Art Director";age = "20"
        }
        addUser {
            name = "Stella"; img = R.drawable.da_img16; distance = "2 km"; proffesion =
            "Art Director";age = "18"
        }
        addUser {
            name = "Sam"; img = R.drawable.da_img17; distance = "2 km"; proffesion =
            "Art Director";age = "25"
        }



    }
    return searches
}

fun generateLaunguge(): ArrayList<Language> {
    val langugage = ArrayList<Language>()
    langugage.apply {
        addLaunguge { launguge = "FRIKAANS";country = R.drawable.flag_south_africa }
        addLaunguge { launguge = "ARABIC";country = R.drawable.flag_saudi_arabia }
        addLaunguge { launguge = "CHINESE";country = R.drawable.flag_china }
        addLaunguge { launguge = "ENGLISH";country = R.drawable.flag_united_states_of_america }
        addLaunguge { launguge = "FRENCH";country = R.drawable.flag_france }
        addLaunguge { launguge = "GERMAN";country = R.drawable.flag_germany }
        addLaunguge { launguge = "HINDI";country = R.drawable.flag_india }
        addLaunguge { launguge = "ITALIAN";country = R.drawable.flag_italy }
        addLaunguge { launguge = "JAPANESE";country = R.drawable.flag_japan }
        addLaunguge { launguge = "KOREAN";country = R.drawable.flag_north_korea }
        addLaunguge { launguge = "RUSSIAN";country = R.drawable.flag_russian_federation }
        addLaunguge { launguge = "TURKISH";country = R.drawable.flag_turkey }
    }
    return langugage
}

fun ArrayList<User>.addUser(block: User.() -> Unit) {
    add(User().apply(block))
}

fun ArrayList<Language>.addLaunguge(block: Language.() -> Unit) {
    add(Language().apply(block))
}

fun getChats(): List<DaChat> {
    var list = ArrayList<DaChat>()

    var chat = DaChat()
    var people = User()
    people.img = R.drawable.da_img7
    people.name = "Alice Smith"
    people.isOnline = true
    chat.chat = "Hi Alice How are you?"
    chat.people = people
    list.add(chat)

    var chat2 = DaChat()
    var people2 = User()
    people2.img = R.drawable.da_img8
    people2.name = "Hennah Tran"

    chat2.chat = "Hi can u explain me this topic?"
    chat2.people = people2
    list.add(chat2)

    var chat3 = DaChat()
    var people3 = User()
    people3.img = R.drawable.da_img9
    people3.name = "Louisa MacGee"
    chat3.chat = " this question is related to this topic"
    chat3.people = people3
    list.add(chat3)

    var chat4 = DaChat()
    var people4 = User()
    people4.img = R.drawable.da_img11
    people4.name = "Walter James"
    people4.isOnline = true

    chat4.chat = " this question is related to this topic"
    chat4.people = people4
    list.add(chat4)

    return list

}

fun getRecents(): List<User> {
    var list = ArrayList<User>()

    var people5 = User()
    people5.img = R.drawable.da_img1
    people5.name = "Nia Scott"
    list.add(people5)

    var people6 = User()
    people6.img = R.drawable.da_img6
    people6.name = "Smith Scott"
    list.add(people6)

    return list
}

fun getPending(): List<User> {
    var list = ArrayList<User>()

    var people = User()
    people.img = R.drawable.da_img2
    people.name = "Alice Smith"
    people.isOnline = true
    list.add(people)

    var people2 = User()
    people2.img = R.drawable.da_img5
    people2.name = "Hennah Tran"

    list.add(people2)

    var people3 = User()
    people3.img = R.drawable.da_img3
    people3.name = "Louisa MacGee"
    list.add(people3)

    var people4 = User()
    people4.img = R.drawable.da_img4
    people4.name = "Walter James"
    people4.isOnline = true
    list.add(people4)

    var people5 = User()
    people5.img = R.drawable.da_profile2
    people5.name = "Nia Scott"
    list.add(people5)

    return list
}

fun getNotifications(): List<DaNotification> {
    var list = ArrayList<DaNotification>()

    var people = DaNotification()
    people.img = R.drawable.da_img7
    people.notification = "Rose viewed you"
    people.time = "12 min"
    people.day = "Today"
    list.add(people)

    var people2 = DaNotification()
    people2.img = R.drawable.da_img8
    people2.notification = "Malanie agreed with your appointment"
    people2.time = "30 min"

    list.add(people2)

    var people3 = DaNotification()
    people3.img = R.drawable.da_img9
    people3.notification = "Sophia liked you."
    people3.time = "17 hour"
    people3.day = "Yesterday"

    list.add(people3)

    var people4 = DaNotification()
    people4.img = R.drawable.da_img10
    people4.notification = "Marrie viewed you"
    people4.time = "1 day ago"
    people4.day = "This week"
    list.add(people4)

    var people5 = DaNotification()
    people5.img = R.drawable.da_img11
    people5.notification = "Malanie liked you."
    people5.time = "1 day ago"

    list.add(people5)
    var people6 = DaNotification()
    people6.img = R.drawable.da_img12
    people6.notification = "Dazza viewed you"
    people6.time = "3 day ago"
    list.add(people6)

    var people7 = DaNotification()
    people7.img = R.drawable.da_img14
    people7.notification = "Stella liked you."
    people7.time = "4 day ago"

    list.add(people7)
    var people8 = DaNotification()
    people8.img = R.drawable.da_img15
    people8.notification = "Tyffany viewed you"
    people8.time = "5 day ago"
    list.add(people8)

    var people9 = DaNotification()
    people9.img = R.drawable.da_img16
    people9.notification = "Sam liked you."
    people9.time = "5 day ago"

    list.add(people9)
    return list
}

fun getGalleryPhotos(): List<DaPhoto> {
    var list = ArrayList<DaPhoto>()
    list.apply {
        addPhoto {
            img = R.drawable.da_img7
        }
        addPhoto {
            img = R.drawable.da_img8
        }
        addPhoto {
            img = R.drawable.da_img9
        }
        addPhoto {
            img = R.drawable.da_img10
        }
        addPhoto {
            img = R.drawable.da_img11
        }
        addPhoto {
            img = R.drawable.da_img12
        }
        addPhoto {
            img = R.drawable.da_img14
        }
        addPhoto {
            img = R.drawable.da_img15
        }
        addPhoto {
            img = R.drawable.da_img16
        }
        addPhoto {
            img = R.drawable.da_img17
        }
        addPhoto {
            img = R.drawable.da_img4
        }
        addPhoto {
            img = R.drawable.da_img5
        }
        addPhoto {
            img = R.drawable.da_img6
        }
        addPhoto {
            img = R.drawable.da_img7
        }
        addPhoto {
            img = R.drawable.da_img8
        }
        addPhoto {
            img = R.drawable.da_img9
        }

    }
    return list
}

fun ArrayList<DaPhoto>.addPhoto(block: DaPhoto.() -> Unit) {
    add(DaPhoto().apply(block))
}

fun getUserChats(): List<DaChat> {
    var list = ArrayList<DaChat>()

    var badge = DaChat()
    badge.chat = "Hey Malanie"
    badge.isSender = true
    badge.type = "Message"

    list.add(badge)

    var badge1 = DaChat()
    badge1.chat = "Hello"
    badge1.type = "Message"

    list.add(badge1)

    var badge2 = DaChat()
    badge2.chat = "Have i bother you?"
    badge2.isSender = true
    badge2.type = "Message"

    list.add(badge2)

    var badge3 = DaChat()
    badge3.chat = "N0"
    badge3.type = "Message"

    list.add(badge3)

    var badge4 = DaChat()
    badge4.chat = "Just Say it"
    badge4.type = "Message"

    badge4.showProfile = false

    list.add(badge4)
    return list
}
