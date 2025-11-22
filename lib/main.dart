import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const WomenSafetyApp());
}

class WomenSafetyApp extends StatelessWidget {
  const WomenSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Safety App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginScreen(),
    );
  }
}

// ---------------- LOGIN SCREEN ----------------

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shield, size: 64, color: Colors.purple),
                  const SizedBox(height: 12),
                  const Text(
                    'Women Safety App',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Login to continue',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email / Phone',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password / PIN',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // For demo: no real validation, just go to dashboard
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DashboardScreen(),
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Demo only • No real authentication',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- DASHBOARD ----------------

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      _DashboardCardData(
        title: 'SOS Emergency',
        subtitle: 'Trigger emergency SOS & alerts',
        icon: Icons.warning_amber_rounded,
        color: Colors.red,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SosHomeScreen()),
          );
        },
      ),
      _DashboardCardData(
        title: 'Live Stream',
        subtitle: 'UI for audio / video streaming',
        icon: Icons.videocam,
        color: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const StreamScreen()),
          );
        },
      ),
      _DashboardCardData(
        title: 'Settings',
        subtitle: 'Theme, safety options, preferences',
        icon: Icons.settings,
        color: Colors.grey,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SettingsScreen()),
          );
        },
      ),
      _DashboardCardData(
        title: 'Fake Call',
        subtitle: 'Simulated incoming call screen',
        icon: Icons.call,
        color: Colors.green,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FakeCallScreen()),
          );
        },
      ),
      _DashboardCardData(
        title: 'Secret Calculator',
        subtitle: 'Hidden SOS behind calculator UI',
        icon: Icons.calculate,
        color: Colors.purple,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SecretCalculatorScreen()),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final card = cards[index];
          return InkWell(
            onTap: card.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: card.color.withOpacity(0.1),
                      child: Icon(card.icon, color: card.color),
                    ),
                    Text(
                      card.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      card.subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DashboardCardData {
  const _DashboardCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
}

// ---------------- SOS HOME SCREEN ----------------

class SosHomeScreen extends StatelessWidget {
  const SosHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS Emergency'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Emergency Help',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Press the SOS button below to start a 5-second countdown.\n'
                'If not cancelled, an SOS alert will be considered sent.\n'
                '(Demo only – no real SMS/call yet.)',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 180,
                height: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SosCountdownScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.warning_amber_rounded, size: 48),
                      SizedBox(height: 8),
                      Text(
                        'SOS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickActionButton(
                    icon: Icons.call,
                    label: 'Fake Call',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FakeCallScreen(),
                        ),
                      );
                    },
                  ),
                  _QuickActionButton(
                    icon: Icons.support_agent,
                    label: 'Helplines',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const _HelplineSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: CircleAvatar(radius: 26, child: Icon(icon)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _HelplineSheet extends StatelessWidget {
  const _HelplineSheet();

  @override
  Widget build(BuildContext context) {
    final helplines = [
      {'name': 'Women Helpline', 'number': '1091'},
      {'name': 'National Emergency', 'number': '112'},
      {'name': 'Police', 'number': '100'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Important Helpline Numbers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...helplines.map(
            (h) => ListTile(
              title: Text(h['name']!),
              subtitle: Text(h['number']!),
              trailing: const Icon(Icons.call_outlined),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Would call ${h['number']} (demo only).'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ---------------- SOS COUNTDOWN SCREEN ----------------

class SosCountdownScreen extends StatefulWidget {
  const SosCountdownScreen({super.key});

  @override
  State<SosCountdownScreen> createState() => _SosCountdownScreenState();
}

class _SosCountdownScreenState extends State<SosCountdownScreen> {
  int _seconds = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _completeSos();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _completeSos() {
    _timer?.cancel();
    final sentAt = DateTime.now();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SosActiveScreen(sentTime: sentAt)),
    );
  }

  void _cancelSos() {
    _timer?.cancel();
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('SOS cancelled.')));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sending SOS...'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('SOS will be sent in', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              Text(
                '$_seconds',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tap "Cancel" if this was an accident.\n'
                'Tap "Send Now" to skip the countdown.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: _cancelSos,
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _completeSos,
                    child: const Text('Send Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- SOS ACTIVE SCREEN ----------------

class SosActiveScreen extends StatelessWidget {
  const SosActiveScreen({super.key, required this.sentTime});

  final DateTime sentTime;

  @override
  Widget build(BuildContext context) {
    final formattedTime =
        '${sentTime.hour.toString().padLeft(2, '0')}:${sentTime.minute.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Active'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sos, size: 80, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                'SOS Alert is Active',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Alert sent to your emergency contacts at $formattedTime.\n'
                '(Demo only – no real SMS/call yet.)',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Status set to SAFE.')),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text("I'm Safe Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- STREAM SCREEN (UI ONLY) ----------------

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Stream (UI Demo)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                height: 220,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.videocam, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Live video stream preview',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '(Placeholder – backend can integrate camera & server)',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text('Mic'),
              trailing: Switch(value: true, onChanged: (_) {}),
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Camera'),
              trailing: Switch(value: true, onChanged: (_) {}),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Start/Stop streaming will be implemented by backend.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.play_circle_outline),
                label: const Text('Start Streaming (Demo)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- SETTINGS SCREEN ----------------

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool notifications = true;
    bool darkMode = false;
    bool vibrate = true;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Enable SOS notifications'),
                subtitle: const Text('Show alerts when SOS is triggered'),
                value: notifications,
                onChanged: (v) {
                  setState(() => notifications = v);
                },
              ),
              SwitchListTile(
                title: const Text('Vibrate on SOS'),
                subtitle: const Text('Useful on mobile devices'),
                value: vibrate,
                onChanged: (v) => setState(() => vibrate = v),
              ),
              SwitchListTile(
                title: const Text('Dark Mode (UI demo only)'),
                subtitle: const Text('Actual theme change not wired'),
                value: darkMode,
                onChanged: (v) => setState(() => darkMode = v),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About app'),
                subtitle: Text(
                  'Hackathon demo for women safety with SOS, fake call, live stream UI, and secret calculator.',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ---------------- FAKE CALL SCREEN ----------------

class FakeCallScreen extends StatefulWidget {
  const FakeCallScreen({super.key});

  @override
  State<FakeCallScreen> createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  bool _callActive = false;
  int _seconds = 0;
  Timer? _timer;

  void _startCall() {
    setState(() {
      _callActive = true;
      _seconds = 0;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _endCall() {
    _timer?.cancel();
    setState(() {
      _callActive = false;
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedDuration {
    final m = (_seconds ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fake Call')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(height: 12),
              const Text(
                'Mom',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text('Calling... (Fake)'),
              const SizedBox(height: 12),
              if (_callActive)
                Text(
                  _formattedDuration,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 32),
              if (!_callActive)
                ElevatedButton.icon(
                  onPressed: _startCall,
                  icon: const Icon(Icons.call),
                  label: const Text('Start Fake Call'),
                )
              else
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: _endCall,
                  icon: const Icon(Icons.call_end),
                  label: const Text('End Call'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- SECRET CALCULATOR SCREEN ----------------

class SecretCalculatorScreen extends StatefulWidget {
  const SecretCalculatorScreen({super.key});

  @override
  State<SecretCalculatorScreen> createState() => _SecretCalculatorScreenState();
}

class _SecretCalculatorScreenState extends State<SecretCalculatorScreen> {
  String _display = '0';
  String _hiddenCode = '';

  void _onButtonTap(String value) {
    setState(() {
      if ('0123456789'.contains(value)) {
        if (_display == '0') {
          _display = value;
        } else {
          _display += value;
        }
        _hiddenCode += value;
      } else if (value == 'C') {
        _display = '0';
        _hiddenCode = '';
      } else if (value == '=') {
        // Secret pattern: "999" triggers hidden SOS alert
        if (_hiddenCode.contains('999')) {
          _triggerHiddenSos();
        } else {
          _display = _display; // no real calculation, just keep same
        }
        _hiddenCode = '';
      } else {
        // Operator (+, -, etc.) – just append to display
        if (!_display.endsWith(' ') && _display != '0') {
          _display += ' $value ';
        }
      }
    });
  }

  void _triggerHiddenSos() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Hidden SOS Triggered'),
          content: const Text(
            'The secret calculator pattern has triggered an SOS alert.\n'
            '(Demo only – backend can send real alert here.)',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7',
      '8',
      '9',
      'C',
      '4',
      '5',
      '6',
      '+',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '/',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Text(
                _display,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final value = buttons[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () => _onButtonTap(value),
                    child: Text(value, style: const TextStyle(fontSize: 20)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
