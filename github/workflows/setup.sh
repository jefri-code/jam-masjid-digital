#!/bin/bash
mkdir -p app/src/main/res/layout
mkdir -p app/src/main/java/com/masjid/digital/audio
mkdir -p app/src/main/java/com/masjid/digital/data
mkdir -p app/src/main/java/com/masjid/digital/receiver
mkdir -p app/src/main/java/com/masjid/digital/service

# Layout Main
cat << 'EOF' > app/src/main/res/layout/activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/mainRoot"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/primary_dark_green"
    android:keepScreenOn="true"
    android:padding="16dp">
    <LinearLayout
        android:id="@+id/headerLayout"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toStartOf="@id/btnSettings">
        <TextView
            android:id="@+id/tvMosqueName"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="@string/default_mosque_name"
            android:textColor="@color/accent_gold"
            android:textSize="28sp"
            android:textStyle="bold" />
        <TextView
            android:id="@+id/tvMosqueCity"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="@string/default_mosque_city"
            android:textColor="@color/text_muted"
            android:textSize="16sp" />
    </LinearLayout>
    <ImageButton
        android:id="@+id/btnSettings"
        android:layout_width="48dp"
        android:layout_height="48dp"
        android:background="?selectableItemBackground"
        android:contentDescription="Pengaturan"
        android:focusable="true"
        android:src="@android:drawable/ic_menu_manage"
        app:tint="@color/accent_gold"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintEnd_toEndOf="parent" />
    <LinearLayout
        android:id="@+id/clockCenterLayout"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:gravity="center"
        android:orientation="vertical"
        app:layout_constraintTop_toBottomOf="@id/headerLayout"
        app:layout_constraintBottom_toTopOf="@id/prayerCardsLayout"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toStartOf="@id/nextPrayerCard">
        <TextView
            android:id="@+id/tvMainClock"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="12:00:00"
            android:textColor="@color/white"
            android:textSize="82sp"
            android:textStyle="bold" />
        <LinearLayout
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:orientation="horizontal">
            <TextView
                android:id="@+id/tvGregorianDate"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:textColor="@color/accent_gold_bright"
                android:textSize="20sp" />
            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="  •  "
                android:textColor="@color/text_muted"
                android:textSize="20sp" />
            <TextView
                android:id="@+id/tvHijriDate"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:textColor="@color/white"
                android:textSize="20sp" />
        </LinearLayout>
    </LinearLayout>
    <LinearLayout
        android:id="@+id/nextPrayerCard"
        android:layout_width="260dp"
        android:layout_height="wrap_content"
        android:background="@drawable/bg_card_active"
        android:gravity="center"
        android:orientation="vertical"
        android:padding="16dp"
        app:layout_constraintTop_toBottomOf="@id/headerLayout"
        app:layout_constraintBottom_toTopOf="@id/prayerCardsLayout"
        app:layout_constraintEnd_toEndOf="parent">
        <TextView
            android:id="@+id/tvNextPrayerTitle"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="MENUJU SALAT"
            android:textColor="@color/accent_gold"
            android:textSize="16sp"
            android:textStyle="bold" />
        <TextView
            android:id="@+id/tvNextPrayerCountdown"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="--:--:--"
            android:textColor="@color/white"
            android:textSize="36sp"
            android:textStyle="bold" />
    </LinearLayout>
    <LinearLayout
        android:id="@+id/prayerCardsLayout"
        android:layout_width="match_parent"
        android:layout_height="110dp"
        android:orientation="horizontal"
        android:weightSum="5"
        app:layout_constraintBottom_toBottomOf="parent">
        <LinearLayout android:id="@+id/cardSubuh" android:layout_width="0dp" android:layout_height="match_parent" android:layout_weight="1" android:layout_margin="4dp" android:background="@drawable/bg_card" android:gravity="center" android:orientation="vertical">
            <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="SUBUH" android:textColor="@color/accent_gold" android:textStyle="bold"/>
            <TextView android:id="@+id/tvTimeSubuh" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="--:--" android:textColor="@color/white" android:textSize="26sp" android:textStyle="bold"/>
        </LinearLayout>
        <LinearLayout android:id="@+id/cardZuhur" android:layout_width="0dp" android:layout_height="match_parent" android:layout_weight="1" android:layout_margin="4dp" android:background="@drawable/bg_card" android:gravity="center" android:orientation="vertical">
            <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="ZUHUR" android:textColor="@color/accent_gold" android:textStyle="bold"/>
            <TextView android:id="@+id/tvTimeZuhur" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="--:--" android:textColor="@color/white" android:textSize="26sp" android:textStyle="bold"/>
        </LinearLayout>
        <LinearLayout android:id="@+id/cardAsar" android:layout_width="0dp" android:layout_height="match_parent" android:layout_weight="1" android:layout_margin="4dp" android:background="@drawable/bg_card" android:gravity="center" android:orientation="vertical">
            <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="ASAR" android:textColor="@color/accent_gold" android:textStyle="bold"/>
            <TextView android:id="@+id/tvTimeAsar" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="--:--" android:textColor="@color/white" android:textSize="26sp" android:textStyle="bold"/>
        </LinearLayout>
        <LinearLayout android:id="@+id/cardMagrib" android:layout_width="0dp" android:layout_height="match_parent" android:layout_weight="1" android:layout_margin="4dp" android:background="@drawable/bg_card" android:gravity="center" android:orientation="vertical">
            <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="MAGRIB" android:textColor="@color/accent_gold" android:textStyle="bold"/>
            <TextView android:id="@+id/tvTimeMagrib" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="--:--" android:textColor="@color/white" android:textSize="26sp" android:textStyle="bold"/>
        </LinearLayout>
        <LinearLayout android:id="@+id/cardIsya" android:layout_width="0dp" android:layout_height="match_parent" android:layout_weight="1" android:layout_margin="4dp" android:background="@drawable/bg_card" android:gravity="center" android:orientation="vertical">
            <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="ISYA" android:textColor="@color/accent_gold" android:textStyle="bold"/>
            <TextView android:id="@+id/tvTimeIsya" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="--:--" android:textColor="@color/white" android:textSize="26sp" android:textStyle="bold"/>
        </LinearLayout>
    </LinearLayout>
</androidx.constraintlayout.widget.ConstraintLayout>
EOF

# Layout Iqamah
cat << 'EOF' > app/src/main/res/layout/activity_iqamah.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/primary_dark_green"
    android:gravity="center"
    android:orientation="vertical"
    android:keepScreenOn="true"
    android:padding="24dp">
    <TextView
        android:id="@+id/tvIqamahPrayerName"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="MENUJU IKAMAH"
        android:textColor="@color/accent_gold"
        android:textSize="32sp"
        android:textStyle="bold" />
    <TextView
        android:id="@+id/tvIqamahTimer"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginVertical="20dp"
        android:text="10:00"
        android:textColor="@color/white"
        android:textSize="100sp"
        android:textStyle="bold" />
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Luruskan dan Rapatkan Saf"
        android:textColor="@color/text_muted"
        android:textSize="26sp" />
    <Button
        android:id="@+id/btnDismissIqamah"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="24dp"
        android:text="Tutup / Kembali ke Jam"
        android:backgroundTint="@color/card_active"
        android:textColor="@color/white"/>
</LinearLayout>
EOF

# Layout Settings
cat << 'EOF' > app/src/main/res/layout/activity_settings.xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/primary_dark_green"
    android:padding="24dp">
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical">
        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="PENGATURAN JAM MASJID" android:textColor="@color/accent_gold" android:textSize="24sp" android:textStyle="bold" />
        <EditText android:id="@+id/etMosqueName" android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginTop="12dp" android:hint="Nama Masjid" android:textColor="@color/white" android:textColorHint="@color/text_muted" />
        <EditText android:id="@+id/etMosqueCity" android:layout_width="match_parent" android:layout_height="wrap_content" android:hint="Kota / Alamat" android:textColor="@color/white" android:textColorHint="@color/text_muted" />
        <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal">
            <EditText android:id="@+id/etLatitude" android:layout_width="0dp" android:layout_height="wrap_content" android:layout_weight="1" android:hint="Latitude (-6.175)" android:inputType="numberSigned|numberDecimal" android:textColor="@color/white" android:textColorHint="@color/text_muted" />
            <EditText android:id="@+id/etLongitude" android:layout_width="0dp" android:layout_height="wrap_content" android:layout_weight="1" android:hint="Longitude (106.827)" android:inputType="numberSigned|numberDecimal" android:textColor="@color/white" android:textColorHint="@color/text_muted" />
        </LinearLayout>
        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="12dp" android:text="Metode Jadwal:" android:textColor="@color/accent_gold" />
        <Spinner android:id="@+id/spnMethod" android:layout_width="match_parent" android:layout_height="48dp" android:backgroundTint="@color/accent_gold" />
        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="12dp" android:text="Mode Audio Azan:" android:textColor="@color/accent_gold" />
        <RadioGroup android:id="@+id/rgAudioMode" android:layout_width="match_parent" android:layout_height="wrap_content">
            <RadioButton android:id="@+id/rbBeep" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Bip Alarm Bawaan (Otomatis)" android:textColor="@color/white" />
            <RadioButton android:id="@+id/rbCustomAudio" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Pilih Berkas MP3 Sendiri" android:textColor="@color/white" />
            <RadioButton android:id="@+id/rbSilent" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Senyap (Tanpa Suara)" android:textColor="@color/white" />
        </RadioGroup>
        <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal">
            <Button android:id="@+id/btnPickAudio" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Pilih MP3" android:backgroundTint="@color/card_active" android:textColor="@color/white" />
            <TextView android:id="@+id/tvAudioFileName" android:layout_width="0dp" android:layout_height="wrap_content" android:layout_weight="1" android:layout_marginStart="8dp" android:text="Belum ada file" android:textColor="@color/text_muted" />
        </LinearLayout>
        <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="horizontal" android:layout_marginTop="8dp">
            <Button android:id="@+id/btnTestAudio" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Tes Suara" android:backgroundTint="@color/accent_gold" android:textColor="@color/primary_dark_green" />
            <Button android:id="@+id/btnStopAudio" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginStart="8dp" android:text="Stop" android:backgroundTint="@color/red_alert" android:textColor="@color/white" />
        </LinearLayout>
        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="12dp" android:text="Jeda Ikamah (Menit):" android:textColor="@color/accent_gold" />
        <EditText android:id="@+id/etIqamahDuration" android:layout_width="match_parent" android:layout_height="wrap_content" android:hint="10" android:inputType="number" android:textColor="@color/white" android:textColorHint="@color/text_muted" />
        <Button android:id="@+id/btnSaveSettings" android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginTop="20dp" android:text="SIMPAN PENGATURAN" android:backgroundTint="@color/accent_gold" android:textColor="@color/primary_dark_green" android:textStyle="bold" />
    </LinearLayout>
</ScrollView>
EOF

# Kode Kotlin: AppPreferences
cat << 'EOF' > app/src/main/java/com/masjid/digital/data/AppPreferences.kt
package com.masjid.digital.data
import android.content.Context
class AppPreferences(context: Context) {
    private val prefs = context.getSharedPreferences("masjid_prefs", Context.MODE_PRIVATE)
    var mosqueName: String
        get() = prefs.getString("mosque_name", "MASJID JAMI' AR-RAHMAN") ?: "MASJID JAMI' AR-RAHMAN"
        set(v) = prefs.edit().putString("mosque_name", v).apply()
    var mosqueCity: String
        get() = prefs.getString("mosque_city", "Jakarta, Indonesia") ?: "Jakarta, Indonesia"
        set(v) = prefs.edit().putString("mosque_city", v).apply()
    var latitude: Double
        get() = prefs.getFloat("lat", -6.175f).toDouble()
        set(v) = prefs.edit().putFloat("lat", v.toFloat()).apply()
    var longitude: Double
        get() = prefs.getFloat("lng", 106.827f).toDouble()
        set(v) = prefs.edit().putFloat("lng", v.toFloat()).apply()
    var calcMethod: Int
        get() = prefs.getInt("method", 0)
        set(v) = prefs.edit().putInt("method", v).apply()
    var audioMode: Int
        get() = prefs.getInt("audio_mode", 0)
        set(v) = prefs.edit().putInt("audio_mode", v).apply()
    var customAudioUri: String?
        get() = prefs.getString("audio_uri", null)
        set(v) = prefs.edit().putString("audio_uri", v).apply()
    var iqamahMinutes: Int
        get() = prefs.getInt("iqamah_min", 10)
        set(v) = prefs.edit().putInt("iqamah_min", v).apply()
    var lastTriggeredPrayerKey: String
        get() = prefs.getString("last_key", "") ?: ""
        set(v) = prefs.edit().putString("last_key", v).apply()
}
EOF

# Kode Kotlin: PrayerCalculation
cat << 'EOF' > app/src/main/java/com/masjid/digital/data/PrayerCalculation.kt
package com.masjid.digital.data
import java.util.Calendar
import kotlin.math.*
data class PrayerTimes(val subuh: String, val zuhur: String, val asar: String, val magrib: String, val isya: String, val subuhMillis: Long, val zuhurMillis: Long, val asarMillis: Long, val magribMillis: Long, val isyaMillis: Long)
object PrayerCalculation {
    fun calculate(year: Int, month: Int, day: Int, lat: Double, lng: Double, methodIndex: Int): PrayerTimes {
        val fajrAngle = if (methodIndex == 1) 18.0 else 20.0
        val ishaAngle = if (methodIndex == 1) 17.0 else 18.0
        val d = julianDate(year, month, day) - 2451545.0
        val g = fixAngle(357.529 + 0.98560028 * d)
        val q = fixAngle(280.459 + 0.98564736 * d)
        val l = fixAngle(q + 1.915 * sin(Math.toRadians(g)) + 0.020 * sin(Math.toRadians(2 * g)))
        val e = 23.439 - 0.00000036 * d
        val ra = fixAngle(Math.toDegrees(atan2(cos(Math.toRadians(e)) * sin(Math.toRadians(l)), cos(Math.toRadians(l))))) / 15.0
        val eqTime = q / 15.0 - ra
        val decl = Math.toDegrees(asin(sin(Math.toRadians(e)) * sin(Math.toRadians(l))))
        val tzOffset = Calendar.getInstance().timeZone.rawOffset / 3600000.0
        val noon = 12.0 + tzOffset - lng / 15.0 - eqTime
        val asarAngle = -Math.toDegrees(atan(1.0 / (1.0 + tan(Math.toRadians(abs(lat - decl))))))
        val asarDiff = (1.0 / 15.0) * Math.toDegrees(acos((sin(Math.toRadians(asarAngle)) - sin(Math.toRadians(lat)) * sin(Math.toRadians(decl))) / (cos(Math.toRadians(lat)) * cos(Math.toRadians(decl)))))
        val magribDiff = (1.0 / 15.0) * Math.toDegrees(acos((sin(Math.toRadians(-0.833)) - sin(Math.toRadians(lat)) * sin(Math.toRadians(decl))) / (cos(Math.toRadians(lat)) * cos(Math.toRadians(decl)))))
        val subuhDiff = (1.0 / 15.0) * Math.toDegrees(acos((sin(Math.toRadians(-fajrAngle)) - sin(Math.toRadians(lat)) * sin(Math.toRadians(decl))) / (cos(Math.toRadians(lat)) * cos(Math.toRadians(decl)))))
        val isyaDiff = (1.0 / 15.0) * Math.toDegrees(acos((sin(Math.toRadians(-ishaAngle)) - sin(Math.toRadians(lat)) * sin(Math.toRadians(decl))) / (cos(Math.toRadians(lat)) * cos(Math.toRadians(decl)))))
        return PrayerTimes(formatHours(noon - subuhDiff + 2.0/60.0), formatHours(noon + 2.0/60.0), formatHours(noon + asarDiff + 2.0/60.0), formatHours(noon + magribDiff + 2.0/60.0), formatHours(noon + isyaDiff + 2.0/60.0),
            toMillis(year, month, day, noon - subuhDiff + 2.0/60.0), toMillis(year, month, day, noon + 2.0/60.0), toMillis(year, month, day, noon + asarDiff + 2.0/60.0), toMillis(year, month, day, noon + magribDiff + 2.0/60.0), toMillis(year, month, day, noon + isyaDiff + 2.0/60.0))
    }
    private fun julianDate(y: Int, m: Int, d: Int): Double {
        var year = y; var month = m
        if (month <= 2) { year -= 1; month += 12 }
        val a = floor(year / 100.0); val b = 2 - a + floor(a / 4.0)
        return floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + d + b - 1524.5
    }
    private fun fixAngle(a: Double) = (a - 360.0 * floor(a / 360.0)).let { if (it < 0) it + 360.0 else it }
    private fun formatHours(h: Double): String {
        if (h.isNaN()) return "--:--"
        val total = (((h + 3600.0) % 24.0) * 60.0).roundToInt()
        return String.format("%02d:%02d", (total / 60) % 24, total % 60)
    }
    private fun toMillis(y: Int, m: Int, d: Int, h: Double): Long {
        if (h.isNaN()) return 0L
        val cal = Calendar.getInstance()
        val total = (((h + 3600.0) % 24.0) * 60.0).roundToInt()
        cal.set(y, m - 1, d, (total / 60) % 24, total % 60, 0)
        cal.set(Calendar.MILLISECOND, 0)
        return cal.timeInMillis
    }
}
EOF

# Kode Kotlin: AudioManagerHelper
cat << 'EOF' > app/src/main/java/com/masjid/digital/audio/AudioManagerHelper.kt
package com.masjid.digital.audio
import android.content.Context
import android.media.*
import android.net.Uri
import com.masjid.digital.data.AppPreferences
object AudioManagerHelper {
    private var mediaPlayer: MediaPlayer? = null
    private var toneGen: ToneGenerator? = null
    fun playAzan(context: Context) {
        stopAudio()
        val prefs = AppPreferences(context)
        when (prefs.audioMode) {
            0 -> playBeep()
            1 -> {
                val uriStr = prefs.customAudioUri
                if (!uriStr.isNullOrEmpty()) {
                    try {
                        mediaPlayer = MediaPlayer().apply {
                            setAudioAttributes(AudioAttributes.Builder().setContentType(AudioAttributes.CONTENT_TYPE_MUSIC).setUsage(AudioAttributes.USAGE_ALARM).build())
                            setDataSource(context, Uri.parse(uriStr))
                            prepare(); start()
                        }
                    } catch (e: Exception) { playBeep() }
                } else playBeep()
            }
        }
    }
    fun playBeep() {
        stopAudio()
        try {
            toneGen = ToneGenerator(AudioManager.STREAM_ALARM, 100)
            toneGen?.startTone(ToneGenerator.TONE_CDMA_ALERT_CALL_GUARD, 4000)
        } catch (_: Exception) {}
    }
    fun stopAudio() {
        try {
            toneGen?.stopTone(); toneGen?.release(); toneGen = null
            mediaPlayer?.let { if (it.isPlaying) it.stop(); it.release() }
            mediaPlayer = null
        } catch (_: Exception) {}
    }
}
EOF

# Kode Kotlin: BootReceiver
cat << 'EOF' > app/src/main/java/com/masjid/digital/receiver/BootReceiver.kt
package com.masjid.digital.receiver
import android.content.*
import com.masjid.digital.MainActivity
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val i = Intent(context, MainActivity::class.java).apply { addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) }
        context.startActivity(i)
    }
}
EOF

# Kode Kotlin: PrayerAlarmService
cat << 'EOF' > app/src/main/java/com/masjid/digital/service/PrayerAlarmService.kt
package com.masjid.digital.service
import android.app.*
import android.content.Intent
import android.os.*
import androidx.core.app.NotificationCompat
import com.masjid.digital.audio.AudioManagerHelper
class PrayerAlarmService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null
    override fun onCreate() {
        super.onCreate()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val ch = NotificationChannel("prayer_channel", "Alarm Azan", NotificationManager.IMPORTANCE_HIGH)
            getSystemService(NotificationManager::class.java).createNotificationChannel(ch)
        }
        val notif = NotificationCompat.Builder(this, "prayer_channel").setContentTitle("Masuk Waktu Salat").setSmallIcon(android.R.drawable.ic_lock_idle_alarm).build()
        startForeground(1001, notif)
    }
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        AudioManagerHelper.playAzan(this)
        return START_NOT_STICKY
    }
    override fun onDestroy() {
        AudioManagerHelper.stopAudio()
        super.onDestroy()
    }
}
EOF

# Kode Kotlin: IqamahActivity
cat << 'EOF' > app/src/main/java/com/masjid/digital/IqamahActivity.kt
package com.masjid.digital
import android.os.*
import androidx.appcompat.app.AppCompatActivity
import com.masjid.digital.audio.AudioManagerHelper
import com.masjid.digital.databinding.ActivityIqamahBinding
class IqamahActivity : AppCompatActivity() {
    private lateinit var binding: ActivityIqamahBinding
    private var timer: CountDownTimer? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityIqamahBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val name = intent.getStringExtra("PRAYER_NAME") ?: "SALAT"
        val min = intent.getIntExtra("IQAMAH_MINUTES", 10)
        binding.tvIqamahPrayerName.text = "MENUJU IKAMAH $name"
        timer = object : CountDownTimer(min * 60 * 1000L, 1000) {
            override fun onTick(ms: Long) {
                val s = ms / 1000
                binding.tvIqamahTimer.text = String.format("%02d:%02d", s / 60, s % 60)
            }
            override fun onFinish() {
                binding.tvIqamahTimer.text = "00:00"
                AudioManagerHelper.playBeep()
                finish()
            }
        }.start()
        binding.btnDismissIqamah.setOnClickListener { finish() }
    }
    override fun onDestroy() { super.onDestroy(); timer?.cancel() }
}
EOF

# Kode Kotlin: SettingsActivity
cat << 'EOF' > app/src/main/java/com/masjid/digital/SettingsActivity.kt
package com.masjid.digital
import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import com.masjid.digital.audio.AudioManagerHelper
import com.masjid.digital.data.AppPreferences
import com.masjid.digital.databinding.ActivitySettingsBinding
class SettingsActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySettingsBinding
    private lateinit var prefs: AppPreferences
    private val launcher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { res ->
        if (res.resultCode == Activity.RESULT_OK) {
            res.data?.data?.let { uri ->
                contentResolver.takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                prefs.customAudioUri = uri.toString()
                binding.tvAudioFileName.text = uri.lastPathSegment ?: uri.toString()
            }
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        prefs = AppPreferences(this)
        binding.etMosqueName.setText(prefs.mosqueName)
        binding.etMosqueCity.setText(prefs.mosqueCity)
        binding.etLatitude.setText(prefs.latitude.toString())
        binding.etLongitude.setText(prefs.longitude.toString())
        binding.etIqamahDuration.setText(prefs.iqamahMinutes.toString())
        binding.spnMethod.adapter = ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item, arrayOf("Kemenag RI", "Muslim World League"))
        binding.spnMethod.setSelection(prefs.calcMethod)
        when (prefs.audioMode) { 0 -> binding.rbBeep.isChecked = true; 1 -> binding.rbCustomAudio.isChecked = true; else -> binding.rbSilent.isChecked = true }
        binding.btnPickAudio.setOnClickListener {
            val i = Intent(Intent.ACTION_OPEN_DOCUMENT).apply { addCategory(Intent.CATEGORY_OPENABLE); type = "audio/*" }
            launcher.launch(i)
        }
        binding.btnTestAudio.setOnClickListener {
            if (binding.rbBeep.isChecked) AudioManagerHelper.playBeep() else AudioManagerHelper.playAzan(this)
        }
        binding.btnStopAudio.setOnClickListener { AudioManagerHelper.stopAudio() }
        binding.btnSaveSettings.setOnClickListener {
            prefs.mosqueName = binding.etMosqueName.text.toString()
            prefs.mosqueCity = binding.etMosqueCity.text.toString()
            prefs.latitude = binding.etLatitude.text.toString().toDoubleOrNull() ?: -6.175
            prefs.longitude = binding.etLongitude.text.toString().toDoubleOrNull() ?: 106.827
            prefs.iqamahMinutes = binding.etIqamahDuration.text.toString().toIntOrNull() ?: 10
            prefs.calcMethod = binding.spnMethod.selectedItemPosition
            prefs.audioMode = if (binding.rbCustomAudio.isChecked) 1 else if (binding.rbSilent.isChecked) 2 else 0
            Toast.makeText(this, "Tersimpan", Toast.LENGTH_SHORT).show()
            finish()
        }
    }
}
EOF

# Kode Kotlin: MainActivity
cat << 'EOF' > app/src/main/java/com/masjid/digital/MainActivity.kt
package com.masjid.digital
import android.content.Intent
import android.os.*
import android.view.WindowManager
import androidx.appcompat.app.AppCompatActivity
import com.masjid.digital.audio.AudioManagerHelper
import com.masjid.digital.data.*
import com.masjid.digital.databinding.ActivityMainBinding
import java.text.SimpleDateFormat
import java.time.chrono.HijrahDate
import java.time.format.DateTimeFormatter
import java.util.*
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var prefs: AppPreferences
    private val h = Handler(Looper.getMainLooper())
    private val ticker = object : Runnable {
        override fun run() { tick(); h.postDelayed(this, 1000) }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        prefs = AppPreferences(this)
        binding.btnSettings.setOnClickListener { startActivity(Intent(this, SettingsActivity::class.java)) }
    }
    override fun onResume() {
        super.onResume()
        binding.tvMosqueName.text = prefs.mosqueName
        binding.tvMosqueCity.text = prefs.mosqueCity
        h.post(ticker)
    }
    override fun onPause() { super.onPause(); h.removeCallbacks(ticker) }
    private fun tick() {
        val now = Calendar.getInstance()
        binding.tvMainClock.text = SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(now.time)
        binding.tvGregorianDate.text = SimpleDateFormat("EEEE, dd MMMM yyyy", Locale("id", "ID")).format(now.time)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            binding.tvHijriDate.text = "${DateTimeFormatter.ofPattern("d MMMM yyyy", Locale("id", "ID")).format(HijrahDate.now())} H"
        }
        val y = now.get(Calendar.YEAR); val m = now.get(Calendar.MONTH) + 1; val d = now.get(Calendar.DAY_OF_MONTH)
        val pt = PrayerCalculation.calculate(y, m, d, prefs.latitude, prefs.longitude, prefs.calcMethod)
        binding.tvTimeSubuh.text = pt.subuh; binding.tvTimeZuhur.text = pt.zuhur; binding.tvTimeAsar.text = pt.asar
        binding.tvTimeMagrib.text = pt.magrib; binding.tvTimeIsya.text = pt.isya
        checkAlarm(now.timeInMillis, pt, "$y-$m-$d")
    }
    private fun checkAlarm(nowMs: Long, pt: PrayerTimes, dateKey: String) {
        val list = listOf("SUBUH" to pt.subuhMillis, "ZUHUR" to pt.zuhurMillis, "ASAR" to pt.asarMillis, "MAGRIB" to pt.magribMillis, "ISYA" to pt.isyaMillis)
        var next = ""; var diff = Long.MAX_VALUE
        for ((name, ms) in list) {
            if (Math.abs(nowMs - ms) < 1500) {
                val key = "$dateKey-$name"
                if (prefs.lastTriggeredPrayerKey != key) {
                    prefs.lastTriggeredPrayerKey = key
                    AudioManagerHelper.playAzan(this)
                    startActivity(Intent(this, IqamahActivity::class.java).apply {
                        putExtra("PRAYER_NAME", name)
                        putExtra("IQAMAH_MINUTES", prefs.iqamahMinutes)
                    })
                }
            }
            if (ms > nowMs && (ms - nowMs) < diff) { diff = ms - nowMs; next = name }
        }
        if (next.isNotEmpty()) {
            binding.tvNextPrayerTitle.text = "MENUJU $next"
            val sec = diff / 1000
            binding.tvNextPrayerCountdown.text = String.format("-%02d:%02d:%02d", sec / 3600, (sec % 3600) / 60, sec % 60)
        }
    }
}
EOF
